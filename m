Return-Path: <jic23@jic23.retrosnub.co.uk>
Date: Mon, 10 Apr 2017 19:10:41 +0100
In-Reply-To: <CAPLgG=kQ-ZaG5W46A8sdtMdOGk7-8jpqTtFNTE_OwfnsYXhC9A@mail.gmail.com>
References: <20170328215259.31622-1-raltherr@google.com> <20170328215259.31622-2-raltherr@google.com> <d05cadfe-e3d3-f4e8-129f-19dcd2f637da@kernel.org> <20170405215046.GE7065@codeaurora.org> <b1919652-4db7-0373-278b-483357968e7e@kernel.org> <CAPLgG=kQ-ZaG5W46A8sdtMdOGk7-8jpqTtFNTE_OwfnsYXhC9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [PATCH v5 2/2] iio: Aspeed ADC
To: Rick Altherr <raltherr@google.com>,Jonathan Cameron <jic23@kernel.org>
CC: Stephen Boyd <sboyd@codeaurora.org>,OpenBMC Maillist <openbmc@lists.ozlabs.org>,Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,William Breathitt Gray <vilhelm.gray@gmail.com>,Michael Turquette <mturquette@baylibre.com>,Andreas Klinger <ak@it-klinger.de>,Rob Herring <robh@kernel.org>,Peter Meerwald-Stadler <pmeerw@pmeerw.net>,Quentin Schulz <quentin.schulz@free-electrons.com>,linux-iio@vger.kernel.org,Zhiyong Tao <zhiyong.tao@mediatek.com>,Geert Uytterhoeven <geert@linux-m68k.org>,Lars-Peter Clausen <lars@metafoo.de>,Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>,Scott Branden <scott.branden@broadcom.com>,Crestez Dan Leonard <leonard.crestez@intel.com>,Akinobu Mita <akinobu.mita@gmail.com>,Fabrice Gasnier <fabrice.gasnier@st.com>,Hartmut Knaack <knaack.h@gmx.de>,linux-clk@vger.kernel.org
From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Message-ID: <010B362C-9A21-4C6B-B810-59C02BB8097C@jic23.retrosnub.co.uk>
List-ID: <linux-clk.vger.kernel.org>



On 10 April 2017 17:34:33 BST, Rick Altherr <raltherr@google=2Ecom> wrote:
>I don't believe there are any bindings changes or a need to revert=2E
>Stephen's suggested changes are small improvements that make the driver
>suitable for non-DT platforms (not an issue anytime soon) and help with
>a
>planned refactor of the clk_hw structure=2E  I'll send out follow-up
>changes
>when Stephen and I have reached consensus on how to resolve the latter
>improvement=2E
Cool=2E Thanks

Jonathan
>
>On Sat, Apr 8, 2017 at 9:15 AM, Jonathan Cameron <jic23@kernel=2Eorg>
>wrote:
>
>> On 05/04/17 22:50, Stephen Boyd wrote:
>> > On 04/01, Jonathan Cameron wrote:
>> >> On 28/03/17 22:52, Rick Altherr wrote:
>> >>> Aspeed BMC SoCs include a 16 channel, 10-bit ADC=2E Low and high
>> threshold
>> >>> interrupts are supported by the hardware but are not currently
>> implemented=2E
>> >>>
>> >>> Signed-off-by: Rick Altherr <raltherr@google=2Ecom>
>> >> Two really trivial things inline=2E I'll fix them whilst applying
>rather
>> than
>> >> having you do a v6 - please do sanity check I haven't messed it up
>> though!
>> >>
>> >> Applied to the togreg branch of iio=2Egit and pushed out as testing
>for
>> >> the autobuilders to play with it=2E
>> >>
>> >
>> > Oh I was too late=2E Blame work=2E Anyway, I made some comments on
>> > v4=2E If they're fixed in a later patch or discussed on list that's
>> > fine=2E No worries on my end=2E
>> >
>> Oops=2E I went a bit quick on this one I guess=2E
>>
>> Anyhow, from a quick read of your comments I'm not sure if any of
>> them are such that we should revert=2E  Perhaps we Rick can prepare
>> a follow up patch covering them?  I got a little lost so am not
>> sure but if there is anything effecting bindings Rick, please
>> get this through asap or let me know if we need to revert for now=2E
>> Even if it is a case of adding a bit of binding and following up
>> with the code using it a bit later=2E
>>
>> I'd asked for input on the clock stuff then forgot all about it on
>> the later version=2E Sorry about that!
>>
>> Jonathan
>>

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
