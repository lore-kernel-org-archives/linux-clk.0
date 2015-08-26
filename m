Return-Path: <sboyd@codeaurora.org>
Date: Wed, 26 Aug 2015 11:36:42 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Govindraj Raja <Govindraj.Raja@imgtec.com>
Cc: linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Zdenko Pulitika <zdenko.pulitika@imgtec.com>,
	Kevin Cernekee <cernekee@chromium.org>,
	Ralf Baechle <ralf@linux-mips.org>,
	Andrew Bresticker <abrestic@chromium.org>,
	James Hartley <James.Hartley@imgtec.com>,
	Damien Horsley <Damien.Horsley@imgtec.com>,
	James Hogan <James.Hogan@imgtec.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	stable@vger.kernel.org,
	Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH v6 4/4] clk: pistachio: correct critical clock list
Message-ID: <20150826183642.GR19120@codeaurora.org>
References: <1440605500-13274-1-git-send-email-Govindraj.Raja@imgtec.com>
 <1440605500-13274-5-git-send-email-Govindraj.Raja@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1440605500-13274-5-git-send-email-Govindraj.Raja@imgtec.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/26, Govindraj Raja wrote:
> From: "Damien.Horsley" <Damien.Horsley@imgtec.com>
> 
> Current critical clock list for pistachio enables
> only mips and sys clocks by default but there are
> also other clocks that are not claimed by anyone and
> needs to be enabled by default.
> 
> This patch updates the critical clocks that need
> to be enabled by default.
> 
> Add a separate struct to distinguish the critical clocks
> as listed:
> 1.) core clocks:
> 	a.) mips clock
> 2.) peripheral system clocks:
> 	a.) sys clock
> 	b.) sys_bus clock
> 	c.) DDR clock
> 	d.) ROM clock
> 
> Fixes: b35d7c33419c("CLK: Pistachio: Register core clocks")
> Cc: <stable@vger.kernel.org> # 4.1
> Reviewed-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
> Signed-off-by: Damien.Horsley <Damien.Horsley@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
