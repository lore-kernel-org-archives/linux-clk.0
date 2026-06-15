Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF835F60A
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512826; cv=none; b=NtEXhqQNjVO0+mDiTwQnYXGt77hJ95L57+48z+kyRWOWiEwbJ5gf854W0nAsPAaVY4JbeMNR830ig4fwaVR4WrS7wa3W3X54WY3zP63htrWwprRG/uGM0Z9Va8+db5M2tb8tM/rmxO8OWgTF0fwVAy4UdRMLWuiSyS6ELUrW/0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512826; c=relaxed/simple;
	bh=CxLuIBdZYNZXt4AwezKYLWgOcNlyIeyrWFvFmQXHd8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jm4nM50z6YS1hEIAWgt2c9ejeDWykZXLScyhE4Fd/Dy9+NsnE7ZzZINvArx23+BPp5+EmUao16PCN9jf2QJQcwlJm6omYkccdBftSQ+RwRb38F51+BkxnO3V+/9AWmuH/DR07Bf9lWKZdZekTcRrUIyh60vD/dfxiISdteYwSDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQxD+A5B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwg0+w7a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQxD+A5B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwg0+w7a"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J1Fa3344660
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ldGIRMP8+HtcjiwpP61O1Mk6
	FK2qtvtU/LAATKNV5UU=; b=QQxD+A5BPzQ0FslBLT7S8wv02FUCCFK2OLKebpVf
	XtVgIuLT3XgWoUZ1y9I3gzYLZjl2dOlj5OiD3JsGWx6y+iehshmzjIV0jxjJSHx8
	WLQfP4SY/NEYi5M9tDDEBYAbkgtKDxs7p8IfFFep/JOg3H00im1lh8vaQAvnjwon
	92+/WUk3FNyjPsSQRZlAu+bri9m+H2tV6fBm2hZwoyAvoxoUl6d6TdVC4D7gwoFL
	mcrhUlIgewt2GKl4ZAADwecfkRLpGG6oOOZc2hA07KXjKIJL4taw2PJRNm1WuD1i
	mXwqrle8el32gNnjozY6usG/a2A47yW8JihRNKM4W+Bn9w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9fefeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:40:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304d0d0b28eso4184890eec.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 01:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512824; x=1782117624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ldGIRMP8+HtcjiwpP61O1Mk6FK2qtvtU/LAATKNV5UU=;
        b=bwg0+w7aFnF/wP9WH/ANexPEDSgu9FisiFkiQTpC2CUbGg2ZF+Rpevv3uI/8FpEfZe
         HXTJgv6eOngdAUQ6HfMgkEhU4i8q6QTiIThnEqhUktapXB/O0P4fhVgAMYttgNoPJXsy
         lwyj5ZHx1SFAUd13cI8rC9GiCKfziDN1hOpYC7qEroIrSKJxb6r/Uys2Xm7W/sfOYuio
         x4X+mzHBHaFScPWOl6slQWFyJMEp8Kdrdi8HEMQYieQW2DqewVpzqgJ8GEA8op1DqzT2
         hvyWhYFPwxbgbvK5ylXXLLFRhJbLljwFcUZVHbppJ1cYWmaDJ8smv/8JfAHlkmGZ5e+V
         cBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512824; x=1782117624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldGIRMP8+HtcjiwpP61O1Mk6FK2qtvtU/LAATKNV5UU=;
        b=K1cAJzyesv5l2DjHGDEcTsnPpx22drlTBNr5x40sss8M0FXgUG0bOquvf7HA4bGjUG
         secTL9YJl1d871fSVZjdYG1NlSab8hC9usbqgHZMTUxhEgjJB93qagKd/2n0490vw4DF
         E/7gvEzveMWztE07CzRdyoSCCd897sd3lm7HJhknJYJlJ/+MaCC+VQ9QbWFP6cpKvOat
         +MxujazROf0H6wmy9Ene4gQMnBypj4B79iEeJ7lSFMbVyzYK/s3OH4bJQinxXHhgeg2l
         r+iadHr330BUiDJJYCyw+6wqw1j57Kz32e+mfRdE73dnTbNaLoWYZRbFg3BZxftZHK49
         0ZYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wGTxYS0+KQWB/02yyv628R6R11+nc3XeOPgbkBl7WYRvDlLgYiepJMc+O7H1DcSJ4NQuRLcQhTn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/MD1AW/bD1lDz3c/yLd6NXWP4lsDmaZ8cFaNK2rKR+eB1Qy6n
	ysBhP39Vfk0ZPW3pKSDww6/UBITDCxReRi4dgSbH+tbSWPNmM3WvZuDtGcCs8EaBtOIiFykErKm
	Z/NAjKYcUbA8h2JlrDN+mXDtOdEmYPNEoyrOQHoMPJqmUoK1G+BMhz7AmOiX3WmI=
X-Gm-Gg: Acq92OGNDmilDcOsZnrxi0Hqct6QgF2hZKuORUWaxMzHYvaDqV/xMhztvxXsM+wGSpo
	3O9Ia4qN1hVTohxbiGlbTr5pqCKKGpY06L5iGO0TTy/0wk87h/ZX743U8UGCV7Rb8Uh5TcUVUed
	llLscXb7haLin1ai70LZwF8Ogh/lPdnGa0RrzagISYiY1sPZvFmlsNjHoTpq6IR23lofCR0faX8
	cO6DwSmHztaoNcrtNubaTVN31Js7mGx0NCTE0mk/iZUpPxDYr+X5CZESm0XxG0U7L1k2mGAGEAE
	Y9wnMSL65zKDBQ2g46q4sWUpSmcGX8xThdsY7CqYFhs+nPLzNAjmBfT9OmruWRNU28YYtA09nMl
	ENhpoov18Wpm9jK/aR5cCaSTuROp/gIOB2ZIDzELq/VKePs6j9EFcl2HBrbnws1qrBRvP
X-Received: by 2002:a05:7300:231e:b0:2ed:e15:c927 with SMTP id 5a478bee46e88-309426f1359mr5772676eec.35.1781512823858;
        Mon, 15 Jun 2026 01:40:23 -0700 (PDT)
X-Received: by 2002:a05:7300:231e:b0:2ed:e15:c927 with SMTP id 5a478bee46e88-309426f1359mr5772645eec.35.1781512823264;
        Mon, 15 Jun 2026 01:40:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48bfa7sm13943568eec.5.2026.06.15.01.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:40:22 -0700 (PDT)
Date: Mon, 15 Jun 2026 01:40:21 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ai+6dYP6Ezzt9Wxm@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <b0479824-0c6d-498d-bdc8-63f678a6f2ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0479824-0c6d-498d-bdc8-63f678a6f2ee@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MCBTYWx0ZWRfX+y4unsUXBNwy
 GoZN6efbNDO2ZiuAnS4yikaMIdBqLfqyX22TPZCeJfeWs7brUMo5ww6mhy983Bh9Op0U2uxvxB8
 634RHBBzjvt7SgxGLeNRS8LGj0YABwupPo0BzRMrbin8McgQGn07CC19XaukbmEixA6oswc5VPM
 3J4koLvbVtlKV24VZgz2/bkjMmS+RBEfaqOsG59/gB69Hs2S+wIHHRfnKvXRU/crAng5I3CMRU9
 R5CCv3W70hCGrbGbKeI/u/4+POasPl6G9FVGLeKWEioD4N1IBvASviAQEvB+1fVfX4cmJus/o1k
 +odiXpANn555kXvMYz6OKuIqU1BdwPpOG5i5rX2HH+8gJc5PWY5oaVxy+n3d4BQKSyxId6Gl7u8
 qHYgyPg80SuYhdPk/pB8/UOVnNzqu4FwU/pSLEhcin0x1RGBAZ7OxvwBZbCFPraThfVfFhH04v/
 pWV7+S8GJUvGjHG1rag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MCBTYWx0ZWRfX8HhcJ+NSGkMJ
 AeLgHvDTS5CISGlkgoyJzQflP8sXQuyiPiqKA0ypV+u+pasQI7tvPkwNxQIm2/t5v98cT6ZH8jx
 hvzEFwsWh2qQFKWJVSugREgjHtNBvZ4=
X-Proofpoint-GUID: zUdORHHLlb4Ba19b-AXNZJDeAoCQry2q
X-Proofpoint-ORIG-GUID: zUdORHHLlb4Ba19b-AXNZJDeAoCQry2q
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2fba78 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=AztkedqbEEiKUJ1lf64A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150090

On Tue, Jun 09, 2026 at 02:57:52PM +0200, Konrad Dybcio wrote:
> On 5/28/26 4:29 AM, Qiang Yu wrote:
> > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > register controls whether refclk is gated through to the PHY side.
> > 
> > These clkref controls are different from typical GCC branch clocks:
> > - only a single enable bit is present, without branch-style config bits
> > - regulators must be voted before enable and unvoted after disable
> > 
> > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > of reusing struct clk_branch semantics.
> > 
> > Also provide a common registration/probe API so the same clkref model
> > can be reused regardless of where clkref_en registers are placed, e.g.
> > TCSR on glymur and TLMM on SM8750.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static int qcom_clk_ref_enable(struct clk_hw *hw)
> > +{
> > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > +	int ret;
> > +
> > +	ret = regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK,
> > +				 QCOM_CLK_REF_EN_MASK);
> 
> regmap_set_bits()
> 
> > +	if (ret)
> > +		return ret;
> > +
> > +	udelay(10);
> > +
> > +	return 0;
> > +}
> > +
> > +static void qcom_clk_ref_disable(struct clk_hw *hw)
> > +{
> > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > +
> > +	regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK, 0);
> 
> regmap_clear_bits()
> 
> [...]
>

Will use regmap_clear_bits in next version.

> > +static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
> > +				 struct qcom_clk_ref *clk_refs,
> > +				 const struct qcom_clk_ref_desc *descs,
> > +				 size_t num_clk_refs)
> > +{
> > +	const struct qcom_clk_ref_desc *desc;
> > +	struct qcom_clk_ref *clk_ref;
> > +	size_t clk_idx;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
> > +		clk_ref = &clk_refs[clk_idx];
> > +		desc = &descs[clk_idx];
> > +
> > +		if (!desc->name)
> > +			continue;
> 
> // this allows "holes" in dt-bindings for $reasons
> if (!desc)
> 	continue;
> 
> // this makes sure the programmer did not omit something important
> // while not taking the entire system down
> if (WARN_ON(!desc->name)
> 	continue;
>
The NULL name check is intentional - the descriptor array is indexed by
clock ID, and mahua has fewer clocks than glymur, leaving holes at
certain indices. So this is expected at runtime. WARN_ON would be noise
log here.

- Qiang Yu
> 
> Konrad
