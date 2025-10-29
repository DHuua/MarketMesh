import Faq from "./components/Faq"
import Features from "./components/Features"
import Footer from "./components/Footer"
import Hero from "./components/Hero"
import ImageSection from "./components/ImageSection"
import Nav from "./components/Nav"
import Testimonials from "./components/Testimonials"
import Why from "./components/Why"

function App() {

  return (
    <>
    <div className="min-h-screen flex flex-col">
      <Nav />
      <main className="flex-grow">
        <Hero />
        <Features />
        <Why />
        <Testimonials />
        <Faq />
        <ImageSection />
      </main>
      <Footer />
    </div>
    </>
  )
}

export default App
