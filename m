Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
Subject: Re: [PATCH 3/8] clk: vc5: Do not warn about disabled output buffer
 input muxes
To: Stephen Boyd <sboyd@codeaurora.org>
References: <20170629101851.23972-1-marek.vasut@gmail.com>
 <20170629101851.23972-3-marek.vasut@gmail.com>
 <20170630192647.GQ22780@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Alexey Firago <alexey_firago@mentor.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <203e6712-bcf1-8b4f-46d4-33cb3108c21b@gmail.com>
Date: Sat, 1 Jul 2017 22:00:12 +0200
MIME-Version: 1.0
In-Reply-To: <20170630192647.GQ22780@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 06/30/2017 09:26 PM, Stephen Boyd wrote:
> On 06/29, Marek Vasut wrote:
>> @@ -549,6 +552,7 @@ static unsigned char vc5_clk_out_get_parent(struct clk_hw *hw)
>>  
>>  	dev_warn(&vc5->client->dev,
>>  		 "Invalid clock output configuration (%02x)\n", src);
>> +
>>  	return 0;
>>  }
>>  
> 
> Please drop this hunk as it isn't relevant to the patch.
> 
Done in V2, thanks.

-- 
Best regards,
Marek Vasut
