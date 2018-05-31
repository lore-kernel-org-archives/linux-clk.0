Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 31 May 2018 11:25:56 -0500
From: Rob Herring <robh@kernel.org>
To: Ray Jui <ray.jui@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Pramod Kumar <pramod.kumar@broadcom.com>
Subject: Re: [PATCH 2/3] clk: bcm: Update and add tingray clock entries
Message-ID: <20180531162556.GA955@rob-hp-laptop>
References: <1527266717-8406-1-git-send-email-ray.jui@broadcom.com>
 <1527266717-8406-3-git-send-email-ray.jui@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1527266717-8406-3-git-send-email-ray.jui@broadcom.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, May 25, 2018 at 09:45:16AM -0700, Ray Jui wrote:
> Update and add Stingray clock definitions and tables so they match the
> binding document and the latest ASIC datasheet
> 
> Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> ---
>  drivers/clk/bcm/clk-sr.c           | 135 ++++++++++++++++++++++++++++++++-----
>  include/dt-bindings/clock/bcm-sr.h |  24 +++++--

This goes in the 1st patch.

>  2 files changed, 137 insertions(+), 22 deletions(-)
