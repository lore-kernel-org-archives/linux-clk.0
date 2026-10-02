Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B8835E92B
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954944; cv=none; b=dbg2aZkVzBvugEJtss+B+7mo/3Gf8PqqJY7zCTIIO69eIvDFE3YyxYmlc5kn+BKG+vJPQSaYKNbhjzOdiTzVEa0qPpe7F/qzzLkDGU7D5l2v1DFBsV7gCO1yOcQqFx4/amE6Y/TgR73ID1DXoJGOrw2dtZharjMShNlRcUWWC3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954944; c=relaxed/simple;
	bh=BFJTgS4+m6AffK666z5geQLSFJoGz9ARqmUsrS1+COg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6o2Tmp2ZR9oac7ZMugEV7dh0PldWIjPAOqUDfBLv5RcxLiUV5xcPQLs7w3V8Sf5QqJrn1K0pkZwSJuSe5FVbLvnaS3700mKDKBmwp8njRdNQjgIHgQ8devxjwamjTkWHFZhurOlvd0hC1MyOp8qcem09zUfkrr4FlLq4kD+fdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GaQ7MIUt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HbuPCUwY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GaQ7MIUt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HbuPCUwY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FHG4h1246879
	for <linux-clk@vger.kernel.org>; Fri, 2 Oct 2026 15:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T1+L8JBJ1croGtbO1Ta2y3Ak
	Tt+nw56WqpEdFXhnL9A=; b=GaQ7MIUtJ+JKgJs2GIEPKZzKMumtWfRp7AUF4MCV
	U0KyYD5yzGLDOVer0vuFN/wf6rZMhAle8XtIeyotA/p9Wt9fnBe5qLBE8QbfqfSw
	M1F47ocrsrwVe0tHOC/3knc/Wswr62hgp2AQxNQVYnbUmQrgEn3ABYuNRlwVOD0J
	Om9M3qh3QhN7seHVv+vBK16Fgwxk/gEk+cvraBr8RfPpJT5M9Yztpy0cMUVRDQPQ
	f3c5KJpoVL//E0xtmZlOzpewmvmjD7dGGNnQWypCD8xM4f+is/LYWv77MlNCV7La
	ZzrSN6YJL+mexcM8GUZKVV17txPyNcsK/2jl+25OsWPgfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2f3d81mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 15:29:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso1398620185a.3
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 08:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790954940; x=1791559740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T1+L8JBJ1croGtbO1Ta2y3AkTt+nw56WqpEdFXhnL9A=;
        b=HbuPCUwYlef5SNKrwZaA/NC1ESXfTQwBrrGHK+0Zp7XOHLV9yxPaK6suYBR3LpG4+s
         hnu0/Os0efA5ixx0en8wjxgHXI8+Qcv72mOS06VaH1uk9kvHLxFpThCgRkxZfavRZ9GO
         +QBFWftdQxmglUCkXi86z6u7VqS9q/wYw+083bY3WPaG/eY/qp6In6f9pBtfC9d/4Duk
         ZV+RyfL89y4ciPIA6sbdnbitTHz/0iB7l+rxPLPKFW7A1jeONfhuQtIKAqrxlciWfkgQ
         86YHH94j77fAeAswLKYT2v2vBuEhGx+pFGxp3SvJNFNZPQgXtMPMCOn8jMEewdjnmJON
         37tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954940; x=1791559740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1+L8JBJ1croGtbO1Ta2y3AkTt+nw56WqpEdFXhnL9A=;
        b=ZzLZtSQkAXqFtsObT4ABap6V7SA7IJKVFgv/yOrrwNOWF3NbPeTqlQ3xyJrnmJ75ZK
         HGoQoMN+A3eY6X0FJ0DnANTkg9/JNXH9F0mB06VPx5cooKvJDCKJOWZ99fm51Z9FWyCI
         A7RNycX4GV94Q2kqcVsLvdihMhCn+d50zegtjmOH3eTWZu5qrNWlnN6N/XSMwQjFKqhG
         DMn/OvdtqVNcbi4DhU2sTpJ1zn8YXF/kr+AOqusyq5QZn9vD7KyXVPrF0j8UZTLPq31b
         KopZVtY3+lbBzfrP/+LZe3VDWb5jrRJT0/obekXddR9w/kkwZx1NqmUHabsJMeuzEIJw
         vcdA==
X-Forwarded-Encrypted: i=1; AKwUvBxQNLycNAaMvt69EJhYp/ij36wj98qvZfxOI189/wmhdkiMMNZqwXOOoZu8fJi3AFuEI3xsJ+orozs=@vger.kernel.org
X-Gm-Message-State: AFuF++ntg5H7QHtFcfLb4+o7LKHOAtzRXedh1ZMeXMNAKIYQ9xQIs05c
	z32/ZSeO5p43qVbmkHyK14dowglPv1dTCprzXbiHDEkq/qd8/I+duHs6GZkIwqnuaToCusyFQlG
	IMvzsQUsx7HHhbjZJQMI0JAlgUAxxIqtE6qQFFvStKrO7n3ukMKcQeI5Jg+DQKDU=
X-Gm-Gg: AYBFou3vMs4750JAjsFckiIycu+BX8fqJmu5oNcbjfgiZFTcVKPzZPSg1oSM7iF3tB+
	ycWpJunMbc5S4KKzcmISlJSpIYtj1lPsofAwgOp87s1lQHhqW2ELVZ7wIiWO8+MKBRSCLO/kPUD
	LBW4yqpBY/aTV1qPo0KvzgroUfcrrA4uVgsAqAmF8vjLfejIloY9kta2ViAgiM5e7aCLhaO7a5/
	JWfPpvheHV/q0pbM4f3YcBsOdxVxe60MisYeStnwlWwNW90rNlzkUOIspTy0+JyPjZSiN7B3eEu
	PsjyjFxK3/t1Ubp4vd/4M0M1T+x1XPenr6KMMPfn5hfsV2BfmROkyKmpb12LzNajQuWYkF6aMbC
	KBNi2DJlOQklZO2eC5hpeG1XKE+6gSuxhgl08I3LJwIXp1ldTWip9NfN7bCmSmVS2+gnGkVWMJS
	bpLEBOld3N43dd
X-Received: by 2002:a05:620a:2623:b0:93e:4bad:af5d with SMTP id af79cd13be357-93e4badb518mr191531985a.55.1790954940140;
        Fri, 02 Oct 2026 08:29:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2623:b0:93e:4bad:af5d with SMTP id af79cd13be357-93e4badb518mr191525085a.55.1790954939567;
        Fri, 02 Oct 2026 08:28:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e33530bsm10506291fa.42.2026.10.02.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:28:58 -0700 (PDT)
Date: Fri, 2 Oct 2026 18:28:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: enable the parent when
 pclk0_clk_src changes rate
Message-ID: <3ccbk6p2khwi4nnz5xrenw2nevazpnp5nnf2iacxgit2mk36cw@3wljgcwiuj3i>
References: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
X-Proofpoint-GUID: iZXpPgOw2fc-G3fcuc_CG8OdnTIGfSTM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX5SesOz80ugsP
 Fpnx5IWPRyyFIwrZXvVzwwfH+amnlUFCRASS1/iQ+WKLCRDxQ7l9OG6dKQwlMcqHeOkreoeEKq6
 l6FDBj6MpyTCyup5U38iYHN0Muf8Qag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX1WyPj/JJUwLM
 Wyge6d3KIk5oM5q7UzRgVE/ZH/9AtgNaLVw1yVlNFsUBIpJI/WCgqB2sotyc/K02CmOz7uEiuYv
 b0sZ0hHeeYn3ao80iSut/SXrCVIwb7O3w3H7Ix768i/c7SIbGksCiuOarIyq5yYOm5pA4F78KOu
 p4LXEc043i1sfPOu+oglhNwhjBEMcfpjZyhI03J4AhfHzNdZi/tpyyRbWFLmR3Hu5GrXSMLjUmb
 ahw0d0i8f1aHFjdHubO134JX+YPAAUV+nknFtROWprxbRig4kV0UPLTCKkC8iahpZU9M0c78Cot
 XMVAKXTYfJcYoTBShkKRdU8GomPB/K7CrP+tU8YMJtrfqjb1zTIVN5hVuFSZTUN8/N77g/aPhxY
 JMAlUMUMWoRI8vWzUthP3wNUriGquCfGzCscgWct2wsqB8zh6+GshGrlnv/wJ8arSEvaRiuLf5S
 JNn1aISXwl75yc8Sy5g==
X-Authority-Analysis: v=2.4 cv=L9SI0OT8 c=1 sm=1 tr=0 ts=6abfcdbd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=YkurVD2kF5Iagc-0gNYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: iZXpPgOw2fc-G3fcuc_CG8OdnTIGfSTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

On Fri, Oct 02, 2026 at 10:55:35AM -0300, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> pclk0_clk_src is fed by the DSI PHY PLL, which
> dsi_pll_14nm_vco_set_rate() resets and only clk_prepare() restarts. The
> DSI host sets the link rates before it prepares the PLL, so the RCG is
> updated against a stopped source, and if it is enabled at that point
> the update times out:
> 
>   pclk0_clk_src: rcg didn't update its configuration.
> 
> Seen on a board whose simple-framebuffer node lists the pixel clock:
> the RCG then reads enabled at msm's first modeset.
> 
> Set CLK_OPS_PARENT_ENABLE so the core prepares the PLL around the rate
> change, as dispcc-sm8250 does for its pixel clock sources since
> commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel
> clocks").
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on the Motorola Moto X4 (SDM630, payton) with the sdm660-mainline
> 7.2.y tree, sdm660_defconfig, DRM_MSM=m: without the flag the warning
> fires in most boots, with it never. At the stall the RCG reads root-on
> and the PLL stopped. With the display built in, clk_disable_unused()
> also prepares the PLL under this flag, and some boots then log "DSI PLL
> lock failed".
> ---
>  drivers/clk/qcom/mmcc-sdm660.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
> index 9f8b8e29fa0f..bc95d0de75a3 100644
> --- a/drivers/clk/qcom/mmcc-sdm660.c
> +++ b/drivers/clk/qcom/mmcc-sdm660.c
> @@ -984,7 +984,8 @@ static struct clk_rcg2 pclk0_clk_src = {
>  		.parent_data = mmcc_xo_dsi0pll_dsi1pll,
>  		.num_parents = ARRAY_SIZE(mmcc_xo_dsi0pll_dsi1pll),
>  		.ops = &clk_pixel_ops,
> -		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> +		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE |
> +			 CLK_OPS_PARENT_ENABLE,

The same fix must be applied to PCLK1 too.

>  	},
>  };
>  
> 
> ---
> base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
> change-id: 20261002-sdm660-pclk0-parent-enable-8123c9ac71d8
> 
> Best regards,
> --  
> Fabricio Akio <fabricioakio@gmail.com>
> 
> 

-- 
With best wishes
Dmitry
