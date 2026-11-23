Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459393;
	b=ltmtorUQkQUVLP8u2HN5Imsiig5XmhxmJMMXLQlFUY6hv9/0pzhTkhWzKyiHfsLkNCRT
	 Gr33sNOYX2cTutRYbhUR/FIjYsFNLVm1aZBNOqBO2bo/TK7aUmexb2RMhn0ZLW58uZ743
	 S/Fivbj0tlPjQrAGQwpKqGOIdOXVQ87qLKhp3QNl5en1HeEVt3D6Y1NdqR8JhVEYQtMhF
	 7UaNSekpbpHHmTTzP1nPyaa1V8wCg8GJbtbk1klDOPKoFBB4XEyKsUulNp5mUrjcy/XjM
	 uSguteoRNX89zsKFIa/dlnhnZOTiN9T3Jpq+fK4b6WkJZVpBT/ITfBmG+VwjCzg6cDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459393;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vPCMziszslBItb1dRp8M4MqozzL0PCZJwazP5bZa3uI=;
	b=xNjGXEQ+pDpb0e0QQofll3mEWq2DLkKG3VxDdSXFggaekCnsoXFPli8lxxJdnA++rTxp
	 U4RvJVvLDnPpipCvBG4n6DoCFS2oC+Gz2eZej+teRN708RNQ/CmIu8cgyGxfbDRQxEx+z
	 dlszhVvfhjspOqOrRwV8UuAQtpqsWkE6pZFnHPb8vZG5dSz7Bm/ihHQC5c5dPS3lWxFtD
	 cSFafNBPOA414q9DuhJonCXSeuM0MYImQr1+noqsjzbLmUigO0ztRtNeU7n4YEXS9Elll
	 vhjFizmHaUN9EBqRb7/BqReIDVE4XLWOxtgMUHgBy+e0ldHTcvEVgBaexZP6E+EoJyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cBwqL+i1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE6D606A31A;
	Mon, 23 Nov 2026 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cBwqL+i1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B1E1F000EE;
	Mon, 23 Nov 2026 18:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459392;
	bh=vPCMziszslBItb1dRp8M4MqozzL0PCZJwazP5bZa3uI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cBwqL+i1+mIvADDJBh6DnqwiZQ+G2cAj6u9DMAmP+W19iYaheDlH7llwrzbjspobx
	 DqxcD63kxUhJMQkc0HhjxDouc8QZEKPcbRSYUOzgyn+Ej6vlQ682hhZZP9T1go5GXy
	 eUSGllKvFGO2Bnhov9PSQdG0ENObDAnCU9TZDN4NBKa3T0qol0WiPxjVjuVV1uUJqv
	 ANo0xjSW7/CScieb3r4DQaT/gIBUksVtp0clVTFwKml2YDlVlTnHVL6kjkb7iCAVaS
	 2wJQ0htloLQgbx/fOZWGPQXKWoPAjHQA3rsz9LUNrDPtASHhFEqAnxrmesAjariHot
	 UmpXtxZKb9+Ww==
Message-ID: <sashiko-outbox-229859@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: gcc-glymur: Set FORCE_MEM_ON for USB4 uC
 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-topic-usb4_clks-v1-3-531ab5635c03@oss.qualcomm.com>
References: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
 <20261123-topic-usb4_clks-v1-3-531ab5635c03@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 18:43:11 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] clk: qcom: gcc-glymur: wrong USB4 clocks in
  clk_glymur_regs_configure()
--

commit 81f271b4a5a581eaebcc7fd24442cd3d1ce247ae
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

clk: qcom: gcc-glymur: Set FORCE_MEM_ON for USB4 uC clocks

This commit sets CBCR_FORCE_MEM_CORE_ON on three USB4 clock branches in
clk_glymur_regs_configure() to retain USB4 uC RAM contents on Glymur and
Mahua.

> diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
> index 031ed806a38ed..96d1c07348bcb 100644
> --- a/drivers/clk/qcom/gcc-glymur.c
> +++ b/drivers/clk/qcom/gcc-glymur.c
> @@ -8542,6 +8542,10 @@ static void clk_glymur_regs_configure(struct devic=
e *dev, struct regmap *regmap)
>  	qcom_branch_set_force_periph_on(regmap, gcc_pcie_5_pipe_clk, true);
>  	qcom_branch_set_force_mem_core(regmap, gcc_pcie_6_pipe_clk, true);
>  	qcom_branch_set_force_periph_on(regmap, gcc_pcie_6_pipe_clk, true);
> +
> +	qcom_branch_set_force_mem_core(regmap, gcc_usb4_0_sys_clk, true);
> +	qcom_branch_set_force_mem_core(regmap, gcc_usb4_1_uc_hrr_clk, true);
> +	qcom_branch_set_force_mem_core(regmap, gcc_usb4_2_sys_clk, true);
>  }
> =20
>  static const struct qcom_cc_driver_data gcc_glymur_driver_data =3D {

[Severity: High]
Should USB4 instances 0 and 2 pass gcc_usb4_0_uc_hrr_clk (0x2b06c) and
gcc_usb4_2_uc_hrr_clk (0xe006c) instead of gcc_usb4_0_sys_clk (0x2b05c)
and gcc_usb4_2_sys_clk (0xe005c)?  With sys_clk passed for controllers 0
and 2, their uC clocks never have CBCR_FORCE_MEM_CORE_ON set, leaving the
USB4 uC RAM contents unretained on those two controllers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-topic-usb4=
_clks-v1-0-531ab5635c03@oss.qualcomm.com?part=3D3
