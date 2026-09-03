Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED664AE8D8
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441512; cv=none; b=mhei+20C4J3XxPcDDqtCk7rB8ceqJGgNwd7/2mj0uTn6gJoUnnWE1xvq3KJUcE6+1sIMPkVI/d8CMIj1abxk7kayWaS8ihibQUVyr7lkuJvgCIqrYQ7yY8Lqv+nvpa0n5xxdGKOd5SEX5+HHotPGOEX9rte+/Nhkw1BGORzd6mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441512; c=relaxed/simple;
	bh=2QaVIM8YaxKqQWbM/hUzSKzUliia1nb/ywpuupEbhuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiLEBA8dPO6TCDE+p2pK4U2IiC4sy17qkmDYY9XlVk1yTzZGdEKrpI8XYgnQ5qOlH6sUPW5zLu/Aj8YXsI4oeb7rNSH6ZSHOnGPe3zGmK+ERxHABOdMSXd6t0OwZTRsZZwTKggTWLKlLnNKk/6lz70PA3VM9zfmgNQQ+O6QxXEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCSV7y1T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O6gRWxtc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCSV7y1T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O6gRWxtc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAdfg4158187
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 13:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z5vNOn+OylGyP9n19xpBlOfa
	6p2e38aOuasVWqv+TX4=; b=gCSV7y1TkZHdEEZXmrNUOTbAchVeKObATGCuLPcy
	Hin5pE+dFQgIaslviYTlZnaTP4agM/l8kdiZpPUYLx75NvudaWW783jdQqaxMyJo
	nbtzHFXTkJvoxZK3FI5Do5DL7AHHYzH9hMnsoPolshv4ohGCWR3vN4wFgR7utuyD
	DTLV0LaTZ9cFX7X3HTF9CzwDaR8/NFc88vAT8yjvUhIolN3JztTbvOPMNLtWJjVj
	9yWao05Ucq+4fIaG19ol7pTe3DKfz8fn6WUa9M/wZWYvl20UXPNA5oyvpHMRda5l
	RZP3YM+tLY3qfSgAezITlFF/RYKUufCKT6njmYoG+I5wwQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pds26c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 13:18:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-74748e3a5b6so1093079137.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 06:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788441501; x=1789046301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z5vNOn+OylGyP9n19xpBlOfa6p2e38aOuasVWqv+TX4=;
        b=O6gRWxtcgq0L2l4kE92JQSfvpkjJYtyX2HcXWV7I84Xj3bUC5D5GE+w+f5VqQK/iqO
         lGerhR3v5F5IWwK9iFjtmKmAwii4UwedETfa8vJt9uKxR5FjQPL+ajumha1vza4IYTwz
         3RYTbnUhIszCjGUPXEwVOtQjlq0v+GWO1MhUsmCNhq6CQNIjh+EM5Ywr5gbzoy3xC4gr
         2w+ZBt6CQQ4AjK7D2yla0JafmZB55+O67ufqU22NX8dAstl8UKAbyEj5iSES8iteD2X8
         M2JwQw7fQiyIrbwBI6600oQWNOCGhp5uhU1QrGi/pEmXyi9336ylcUVd8z4+Wk36av3D
         mK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441501; x=1789046301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5vNOn+OylGyP9n19xpBlOfa6p2e38aOuasVWqv+TX4=;
        b=F5qfOOhASKM3bC5t0nnASx9dXclWRKBYuav5GBszmq8gJKzVBBxZDbswcT4OZ3af85
         dvjActowLQBZpqs6uB8P3eycwSm10KOWPgJl1ClquVIw2alDRkP9zigR/2GIb+BKC/Kc
         7M2svHesjPI+Dpfzizlg80Efi7mNySmz9kgPsJEwDLANqM4/CcsdessgeLiBRwHq1XYw
         NEs4lsDIpCb3qDmwjhXH4uPyktj9BpeWUe1A/sSciM5GPJN6YzDfOE47biL1EbkjePQN
         uOa5yv4Y7MyspB8XMHgD3RByjKj3B58MUSwG9ml/lV0UnadZLJU+9UBLUjZ7DwveDzTj
         KSag==
X-Forwarded-Encrypted: i=1; AKwUvBxhuVfpdFWpzipLKwHYdY9PB3ZnqVZjlTIaLrBr/b/I/pkpqdOig3DTGVN5rJ+R0CUNZ4WPnuaMG3I=@vger.kernel.org
X-Gm-Message-State: AFuF++mo3vDCqrn7RBaFiSP2oa43HLT7SEiU6x7GPDf4E4Lwqiu2e2Da
	T1sCuvlFW9KSrztmI5DmOxXPGJXTWxrrydxXu4QZCRlr6iO9brQYl8RaHOnMd+PkBhqtpfrB6Fc
	MqaZ/MsdgSOPbgOiwUrF9FyyNlFhgp+bXIkZigZZlDcndW6Z1TT2j7nok9QcBZrU=
X-Gm-Gg: AYBFou3vkEetIkEWcp66HgRP0RdNj+t8f52WFc28EMI4HFV9Qe9PDkLwcYdnkSrwoDb
	VAFdhUbltsd9rn6HP5tJfWiPtW3Ej801kbBgud0m0T2B4A4rLENYlgbriQg0lcCQectPughZo8E
	VJ65Bkis4E3QYs4pBS0FGGe2/M3xNEvRvPpsrhXoqpHYWYE6yYhj8M4AET0Q2CqDTXZgyqqpm1I
	b+5m6U5QRO95TuDuM4ERoKXY/qq32SY4HmN/7Od/KDkhyOBbrtVY5eS3v5fg4mV08ahJBK7xHKB
	Lw1ihEaR35QWHE1ypAKLH36dj42t9g7w+jTfGO47WYgpi9DmsTAG7Va+Z/2i2PXyKSape9AfJEA
	t35/c+6wyPKj6
X-Received: by 2002:a05:6102:1676:b0:785:6719:abb1 with SMTP id ada2fe7eead31-78a2ef7b044mr1223352137.11.1788441500974;
        Thu, 03 Sep 2026 06:18:20 -0700 (PDT)
X-Received: by 2002:a05:6102:1676:b0:785:6719:abb1 with SMTP id ada2fe7eead31-78a2ef7b044mr1223334137.11.1788441500321;
        Thu, 03 Sep 2026 06:18:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d1fe2sm80599295e9.3.2026.09.03.06.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:18:18 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:18:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2
 clock
Message-ID: <j6m4b2psvvg65qksij63wxo3aqoc5ldlfehqnywa3i33v4pm5j@lr4i5o2g6tdt>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNCBTYWx0ZWRfX//k/H+2E0hK3
 KzbXLa8TaF3+B8buQj35JIGK7y7ejIaF33qbz382VYk8SubNauIVO4SNEoTNReqtwQeDdw8BEBK
 uuocA1EcUhmUYVdaxNWMhOHVhEe+BS0=
X-Proofpoint-ORIG-GUID: Sc9gGvpqVKmHa2RjONo5scRuox2n9txK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNCBTYWx0ZWRfX4M+U1aVXnJwe
 ohOEqC9JJVIQiaJYiNH2Wiw1I4BlPGFrgDwvnqQTpixv9FRmdaOViJbtglKZTG9fkLYs4XPYb4M
 KcoWb9ZsmdwjzjlKko80mlt6ft+K2u0Ee9dBJRg2VfuzyuxvET2FKuAfut7p60wpM53/rHMzfaK
 SWm9pzl/uyoOTluycRYOL4Y0EbLuoyZ/fer9D0X1jRG9rsu3cKuiKcF3bHF/m9dndYB0J7C5mzc
 0EYHSjx2ZhYwC5CB6r0c5w1Oaj7j0ebP57FKG3sXeIAEpLnNC8G6oaUX6lkVVIUVjeak8jio73a
 PZfT1GjJlgC5Gzd7oNDECiu1j3g9T9lXA2uOSVKAR0YXCfxIi7wScRml5Jx4bT5kBOWhdrhsomr
 UkvCUejG8ZDuF8DQFUFvwQn6h2G2UqmQ532L7ZKQI35drCe7G1IxOk6g/JZsTXe2bXD0jIi+lkE
 KkgZbLjA4io+gC0I1Hw==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a99739d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rjAelre24C4lQ5HC_LQA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: Sc9gGvpqVKmHa2RjONo5scRuox2n9txK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030114

On 26-08-14 05:48:14, Luo Jie wrote:
> Most CMN PLL output clocks are derived from the 12 GHz PLL output
> through a shared, physical /2 stage, ahead of any further per-clock
> processing: a gated fixed rate (PCS/ETH0/ETH1/ETH2/EPHY/ETH), a
> configurable divider (NSS/PPE/PON), or a rate-select bit (EPHY-RAW).
> This /2 stage is present in the CMN PLL block on every SoC supported
> by this driver, not just IPQ5210.
> 
> Register this /2 stage once as a fixed-factor clock, "cmn_pll_div2",
> and store it on struct clk_cmn_pll so the output clock types added by
> later patches can parent on it. The two plain fixed-rate outputs,
> xo-24mhz and sleep-32khz, are the exception on IPQ5210 SoC: they stay
> parented directly on the main PLL clock.
> 
> On SoCs other than IPQ5210, every output clock is a plain fixed-rate
> clock (CMN_PLL_CLK_FIXED_RATE) whose rate is a hardcoded absolute
> value rather than one computed from the parent rate, so this /2 clock
> is registered there but currently has no consumers; IPQ5210 is simply
> the first SoC in this driver whose output clocks are modeled as
> depending on parent_rate, which is what makes the /2 stage significant.
> 
> This patch only registers the clock; later patches wire it in as the
> effective parent for the output clock types that sit downstream of it.

Do not mention future patches here. Each patch has to stand by itself.

> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/ipq-cmn-pll.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
> index 4fdf78f6829e..bcb51a5f559a 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> @@ -96,10 +96,17 @@ struct cmn_pll_fixed_output_clk {
>   * struct clk_cmn_pll - CMN PLL hardware specific data
>   * @regmap: hardware regmap.
>   * @hw: handle between common and hardware-specific interfaces
> + * @div2_hw: fixed /2 clock derived from the CMN PLL output; present on
> + *           every supported SoC, but only IPQ5210 currently parents
> + *           any output clock on it (every output clock except the
> + *           plain fixed-rate xo/sleep clocks, which stay on the main
> + *           PLL); other SoCs' output clocks use hardcoded rates that
> + *           never depend on a parent
>   */
>  struct clk_cmn_pll {
>  	struct regmap *regmap;
>  	struct clk_hw hw;
> +	struct clk_hw *div2_hw;
>  };
>  
>  #define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
> @@ -362,6 +369,7 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
>  	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
>  	struct clk_hw_onecell_data *hw_data;
>  	struct device *dev = &pdev->dev;
> +	struct clk_cmn_pll *cmn_pll;
>  	struct clk_hw *cmn_pll_hw;
>  	unsigned int num_clks;
>  	struct clk_hw *hw;
> @@ -388,6 +396,20 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
>  	if (IS_ERR(cmn_pll_hw))
>  		return PTR_ERR(cmn_pll_hw);
>  
> +	cmn_pll = to_clk_cmn_pll(cmn_pll_hw);
> +
> +	/*
> +	 * The CMN PLL output feeds a shared, physical /2 stage ahead of
> +	 * any further per-clock processing (a gated fixed rate, a
> +	 * configurable divider, or a rate-select bit). Register it once
> +	 * as a fixed-factor clock so the output clock types added by
> +	 * later patches can parent on it.

The comment here should only say why this is needed. Do not mention
future patches.

> +	 */
> +	cmn_pll->div2_hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, "cmn_pll_div2",
> +								       cmn_pll_hw, 0, 1, 2);
> +	if (IS_ERR(cmn_pll->div2_hw))
> +		return PTR_ERR(cmn_pll->div2_hw);

In fact, I think this clock registering is self explanatory as is, so you
should drop the comment above it.

> +
>  	/* Register the fixed rate output clocks. */
>  	for (i = 0; i < num_clks; i++) {
>  		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
> 
> -- 
> 2.43.0
> 
