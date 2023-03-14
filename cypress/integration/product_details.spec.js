describe('Product', () => {
    it('Should visit the home page', () => {
        cy.visit('/')
      })
    it("Click on the Scented Blade Product", () => {
        cy.get('img[alt="Scented Blade"]').click()
        cy.wait(100)
        cy.get('.quantity > span').contains('18 in stock at ')
    });
})
  