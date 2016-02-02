Return-Path: <andre.przywara@arm.com>
Subject: Re: [PATCH 08/11] clk: sunxi: improve error reporting for the mux
 clock
To: Maxime Ripard <maxime.ripard@free-electrons.com>
References: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
 <1454348370-3816-9-git-send-email-andre.przywara@arm.com>
 <20160202180227.GC4652@lukather>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
   Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
   linux-kernel@vger.kernel.org,
   =?UTF-8?Q?Emilio_L=c3=b3pez?=
 <emilio@elopez.com.ar>,
   Michael Turquette <mturquette@baylibre.com>,
   Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
From: Andre Przywara <andre.przywara@arm.com>
Message-ID: <56B0EFFD.8070900@arm.com>
Date: Tue, 2 Feb 2016 18:05:49 +0000
MIME-Version: 1.0
In-Reply-To: <20160202180227.GC4652@lukather>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Salut,

On 02/02/16 18:02, Maxime Ripard wrote:
> On Mon, Feb 01, 2016 at 05:39:27PM +0000, Andre Przywara wrote:
>> clk_register_mux returns a pointer wrapped error value in case of
>> failure, so a simple NULL check is not sufficient to catch errors.
>> Fix that and elaborate on the failure reason on the way. The whole
>> function does not return any error value, so silently failing may
>> leave users scratching their heads because the kernel does not
>> provide any clues on what's wrong.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> Applied, thanks.
> 
> Any chance you do that for the other functions? :)

Sure, that was actually a test balloon ;-)

Cheers,
Andre
