describe('Home', () => {
    it('Should visit the home page', () => {
        cy.visit('/')
      })
    it("Add Scented Blade to the cart", () => {
        cy.get('form[action="/cart/add_item?product_id=2"]').click()
    });
    it("Confirms cart incremented by 1", () => {
        cy.get('.nav-link').contains('My Cart (1)')
    })
    
})
  