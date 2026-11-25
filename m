Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621004;
	b=EipXUFei56cwPb2WR2PRCnzmDC7BgCAkmp0XA1IJLafo9WqN1NNXLZup3JRSqiTqatMd
	 Ypy4sEA2RzWNHmr+wy56v9p64m5CGCaSl1oYLUUmHnMFWl3Cm91OLjgZ88njPvG2tD2UH
	 xvh9B01sojA57Q9JM/62ALONPTX+m/1k4JQOKs7mfIjzxrDzVsEshMB+/kI25thQH7Aii
	 BJ/dV8743WxCDkq1VVRHrQHZK2rQgn8v7zBouMFgwObWrbru/LAI9t27WMk9iZfv++4sK
	 OF16FkhML/rIhp9OQM3zRRS1DHrr/PJK+fXcPPmDVI4vDl4klerKj/DdmQGsPp9VceQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621004;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PmtTlvmM6hCvzvwFyf+XsL7FIz70Z7M5twtwP3LaFv4=;
	b=Ax2dkM5F8HLO/0tAcFq+hrxW+2BPbYknvefNmjs9Y2nXX8l7SDQhniFbKQx9K0Ugf5qk
	 cefCLQcNvj7Cw3oB4OtTE133Ktbo7T34Gl4Igx49binul3zL3wisjfM/BSnkcGWJtkZpT
	 UyLyXPwba/cOe43I4hGXZZ+hnTTJ/DprqsUR3BdqLvBAUG+MFe3v51qvxMmpE7Pbp3J8+
	 zIwGGTRCs8NPDlljua24PaBOtmzTrUd90MfJo6VfVRVsuVFwdhhzUuG6UUJiG/mebt48L
	 LbOFTHBjh8kiVwn1ej+Bmm0xySVUzBd0C4O5pW4TR+T2+PyZ2g6U9sMMsROiggpPKoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sd7w0GS2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13126607DE71;
	Wed, 25 Nov 2026 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sd7w0GS2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649631F000CF;
	Wed, 25 Nov 2026 15:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621003;
	bh=PmtTlvmM6hCvzvwFyf+XsL7FIz70Z7M5twtwP3LaFv4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Sd7w0GS2tV+oPG34BJl7pqxTYnELGWttGNE07HRxbSwvN1i7XxwOA9ncIpcH5EIK1
	 +SJ4/m5htirRajP6p++RZCg1X97imuUipSt543qksmuAI5WO/ByUgzZNULpujbsAE4
	 tZR9F4BJCLr8rxIeREvVrrtkXnX9JwZSV3ZR0m61nx/C1tdpdT5f3n6IEUtkczXwQW
	 yDaCfKlcpsElTOAtjmIsf6DQY0GrDY3f+GKO/cW2FHIOUMHwiRMlhdX8INMuSZJ98g
	 0feoskESs6L3IqP1CmlVxst3hbLZ38yXC//UoXXqC0bO4DZlthnQVeS3wswh/0xzUX
	 evNe+plGvuEfA==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 6/8] clk: clocking-wizard: Use dev_err_probe() when
 mapping registers
From: Brian Masney <masneyb@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com, 
 shubhrajyoti.datta@gmail.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261124035613.1968260-7-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
 <20261124035613.1968260-7-shubhrajyoti.datta@amd.com>
Date: Wed, 25 Nov 2026 10:36:33 -0500
Message-Id: <179562099317.458327.5984129720101489360.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=no6SaYSC95ugbFS6jjenpXh2ngHl0wKL9cbLDii/g90=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLZGVqmc9o/vNW4pez+vcWPBfp23LqYtPqHj2Ton8XFG
 9bu2hTm21HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBELP8xMhyXEnSTvlQoMf3c
 o1Uv+k04gxkWlyakJtrteaJteTTwjxcjw57N8XmvlHx+e17fyh93LNx0UoeI1IanxQnsAVFmL7U
 v8AIA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Shubhrajyoti,

> Align the devm_platform_ioremap_resource() error path with clk_in1 and
> s_axi_aclk handling for consistent logging and deferred-probe behavior.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> (no changes since v1)
> 
>  drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> index a3f4c5d6495e..7fe8d0d4cfba 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -1414,7 +1414,8 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>  
>  		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
>  		if (IS_ERR(clk_wzrd->base))
> -			return PTR_ERR(clk_wzrd->base);
> +			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->base),
> +					     "failed to map registers\n");

The Sashiko output looks legit here. Drop the message.

Brian

-- 
Brian Masney <masneyb@kernel.org>
