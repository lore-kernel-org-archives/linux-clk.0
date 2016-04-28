Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:59714 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753623AbcD1Vb1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 28 Apr 2016 17:31:27 -0400
Date: Thu, 28 Apr 2016 16:31:22 -0500
From: Rob Herring <robh@kernel.org>
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: thierry.reding@gmail.com, tony@atomide.com, paul@pwsan.com,
	t-kristo@ti.com, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, vigneshr@ti.com, nsekhar@ti.com
Subject: Re: [PATCH v7 4/9] pwm: pwm-tiecap: Update dt binding document to
 use proper unit address
Message-ID: <20160428213122.GA27352@rob-hp-laptop>
References: <1461710209-6563-1-git-send-email-fcooper@ti.com>
 <1461710209-6563-5-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461710209-6563-5-git-send-email-fcooper@ti.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 26, 2016 at 05:36:44PM -0500, Franklin S Cooper Jr wrote:
> Replace unit address from 0 to the proper physical address.
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-tiecap.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt b/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
> index 788da6c..1b7eec5 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
> @@ -16,21 +16,21 @@ Optional properties:
>  
>  Example:
>  
> -ecap0: ecap@0 { /* ECAP on am33xx */
> +ecap0: ecap@48300100 { /* ECAP on am33xx */
>  	compatible = "ti,am33xx-ecap";
>  	#pwm-cells = <3>;
>  	reg = <0x48300100 0x80>;
>  	ti,hwmods = "ecap0";
>  };
>  
> -ecap0: ecap@0 { /* ECAP on am4372 */
> +ecap0: ecap@48300100 { /* ECAP on am4372 */
>  	compatible = "ti,am4372-ecap", "ti,am33xx-ecap";
>  	#pwm-cells = <3>;
>  	reg = <0x48300100 0x80>;
>  	ti,hwmods = "ecap0";
>  };
>  
> -ecap0: ecap@0 { /* ECAP on da850 */
> +ecap0: ecap@1f06000 { /* ECAP on da850 */
>  	compatible = "ti,da850-ecap", "ti,am33xx-ecap";
>  	#pwm-cells = <3>;
>  	reg = <0x306000 0x80>;

These still don't match.

Rob

> -- 
> 2.7.0
> 
