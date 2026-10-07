Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C3483BEA
	for <linux-clk@vger.kernel.org>; Wed,  7 Oct 2026 11:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373158; cv=none; b=txsvnPHQRmHZGP60EpYyXCispyHI2bjX4SoNeTtcgpDKzXKC5NoP2943v7TKkRkh2P70dyd9bDnMhhxoG6nhZ+QMyi+46RZEPhxnYKoaT4cec38Ev4jh7pnFrEwPg+hIsNufzjcgVMYn6NxRNLW3zejQzN3UYOcRiBGzu7cbdd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373158; c=relaxed/simple;
	bh=z4QPXpORVR5Xf14NHBxY1G3zQ9aOG4ZT/P3y7qfWzbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjmWdOWTP8htCKn/oOvuG4qLOdP+p1aLfz1A/RmjbzhBl8o8ByrOO6BzjAThrCZvJVN260osywQjdmjfkTZChGKLkbJd/GelSLd8A3BIPwIrYGZSWsef9YDJiTJnt3TsoFW19fKAHdkxWJqizWPFBZOzwaeBp1qvafyWzcydUIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFWpsaM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zklg1mTO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFWpsaM3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zklg1mTO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV0ev3686733
	for <linux-clk@vger.kernel.org>; Wed, 7 Oct 2026 11:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y/ODJYOMLcLA3XO60L/6kQfC
	Nx0dr3FAvgPHpiaMSw8=; b=kFWpsaM3uBnj+SQSSPSWj8W3L5nrFiS3+BaAXHuS
	ZttBZf93Dp6MWRnHpNbAIXd+bSogPgPl/erpsFZQZw82MzLt6T96MCxzTX0z4P7q
	k1ka6Zn+KGPQZOyOUdb1f6lHNshZSo5cM0eVLnWs4/P265cNYpeGpAboDwo8Maf9
	5ewdL+aMWnVTQJ5I15QumYMf8wA7TkLii3helWFmdPZ06n73cctKR6RvnpWZAy+D
	68j4Mjs8i7HTvJd3tCKLs8clXKUNiIU6Wy06hVVsTGjvV7XPo3ZHTHnxigMRuxe8
	zKq7XD0ZeaaEsxkWEUiASUmz3o9ysKKKS4WdpMSQouj/jg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mgr8686-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Oct 2026 11:38:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3516711cce6so326175eec.1
        for <linux-clk@vger.kernel.org>; Wed, 07 Oct 2026 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791373126; x=1791977926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/ODJYOMLcLA3XO60L/6kQfCNx0dr3FAvgPHpiaMSw8=;
        b=Zklg1mTOF072cCzChT4luOSR5PV2GJWzjo4al1oWV5fpahfXazmi8b3LeBqnKu8+Gp
         4q0V7vzFCC4/bNmVQPTTb2E3m9+h7cslNbL198u5te4gTHtkeosAqSmPEseIw/k9Ir/k
         NyG13vUAWBxvEkbhPt9MmKtxyu+owW6SPVhsCXcha0CsjCGss1i7R8vp4VOKlpSZv+Fo
         ISI49jL8TbESU1UVk2FSQnnL5QuFbKZaztLiSs8dszfH81JaP4a0Yv8KRDmAZ+ygSCv2
         0BkR6a07TtrCofVNtmSttKzC6HmHdmd2BQXpUHBlpJMEGY/eJlr7v5RIKCwcaQMzTac/
         KTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373126; x=1791977926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/ODJYOMLcLA3XO60L/6kQfCNx0dr3FAvgPHpiaMSw8=;
        b=m3z8v+c7Nt8/jZ007zp0f353aWW9imQMMlceHSn5O0lrv0PCZ409AXjJ+NYLSg9Ukw
         gPmvB/zmacCKkoBqftBUhkcNKGAKEOJWZMAQkV62oQVxSWrgeSPKiurvNKly7PUi9dZy
         M5u2n7aOOWmLh6fZNmZBzbx0kYZdKRxyIhf2zJ6u5Berhle4X+pNVO7Uhqn2yVZU1/rU
         Ppzggwnuu1cvW8wO/kpu27UxTUrjMAyTnHu3a7y3oHI+a5g/eTAS20PPZqc1exhsL22a
         2Ryqju+ZXAzucx8QjCY5CZXkDPqFgxEg4ph/ld/8k5ZA8PuIjulNPTl0rQFuzrCqj5wB
         m1KA==
X-Forwarded-Encrypted: i=1; AKwUvBz6krtP5TsJMfz223EnTyYLKIMQ44qoKcNw9guOPEpCP/s1CcuGCMad2iS1lbR3uoSsSWUfIjmhpmU=@vger.kernel.org
X-Gm-Message-State: AFuF++li+EA977GqNMYQrDd5DJ0j7EeLoLsHjNBO4Ob0DlqJJI/z5p/B
	ZdJylbHGTV1UpVmAbhr6vL9uG/xfP2ZHSHJIRvoq+yDz6Mm9DCrkAtj2/yUbElb4m0SveElYR+z
	J+RFjJrTQ3R0XU7BdXWDwfnfnW/PRGVletQ57hFpYQG7tXOMEnAtgFZkQIl2MAIQ=
X-Gm-Gg: AYBFou3UfZNr1mUgBqpYmwBEU8AwDTS2h482RZw+jU+NV7+fuL9+D9SYLRHL8GZlJWm
	eaPSCKjAQVgFwapzI3u3qyOus7oBxviBK+J906BQXTMxMV/nkLnbAz/Bw1rrnVjXxMABusnDFhq
	xPUdbav89VrYhR8Fl4Q0sF3FnABLwpMK0aSbgyBr3QxtJWv0LoTFhWBUirwM1iM3zhpxUuauUqD
	KlH88qu/IhO8pBLTtivUyM4JuJK1Ne4Jwv25HeZoQztKKKs+9Nub/QmgTdQh9W7Um3tohJa15f2
	Yqm68f7C9PgADa3mt/VrGDScQLGRHtnkvdwvd+njaYz8mVeVey3d/bJd06EGvR61VkivZqYV6TZ
	1eqXlXpYUG9Kvh+eeaKV7uru8LazHg26pCahEhQzpeA==
X-Received: by 2002:a05:7022:439b:b0:143:f79:f662 with SMTP id a92af1059eb24-15d27917976mr7990391c88.1.1791373125594;
        Wed, 07 Oct 2026 04:38:45 -0700 (PDT)
X-Received: by 2002:a05:7022:439b:b0:143:f79:f662 with SMTP id a92af1059eb24-15d27917976mr7990358c88.1.1791373124948;
        Wed, 07 Oct 2026 04:38:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615ece2d14sm9539683c88.1.2026.10.07.04.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:38:44 -0700 (PDT)
Date: Wed, 7 Oct 2026 19:38:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: negcc-nord: Keep the AHB2PHY_0 bridge clock
 always on
Message-ID: <asYvP2vhMJTw-xfl@QCOM-aGQu4IUr3Y>
References: <20261007073146.3162478-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007073146.3162478-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX2RhnJ3Bu8Gsb
 Djp5SVHXoeB/RVOXv+krn6k8BlkVQi369Y2TazCVXQo3/MZAUYSTNNN6zGp93ZNRTEovy7rOTqT
 ZMMd5iYQidQgrV66zx1ibbO1IWdFixX/soYV/GjoL15Up2HbG1QjqtOWWheXp9UmDKJMDhEIWvK
 Cv0vdoixgNFpP44qV3Zc6SoToyEe+8FS1R1ULpdUi5rt5/LGh4MPVp8R9dtQn5BNyngcCi6W91M
 yceiCvbbYOGmU7L49EXfgSnyJB6qYGa600BGSN52Cul7tXn/RnjV33tyRn7Lx42/dQWeqvQHesu
 KPdyTOzwCdFOFqdiKlrnRLkElCThklc6D7iCp38Xs+NtcyarPaPVh+MVMyvq9ftcSWibNNJcjF6
 HHuNsXxERUfaPU0BTLTukTJlElzp1A1UxTQAzoX5jaCRX8LMj0/EGwcXHQgUJAmhR/WDyOanhgb
 E/BnA0VVK4XaEHXc4Vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfXxvheqEyDIfE0
 NiydvJUBlJivXoU1YyfBwppmiN0CyfbFbQzjL71Dz37rOHIhJ+x3hAlzynothJDPK4CwXuNyT3i
 yJ3GW1ppCaNlR7ARrOccbJsCgcpp4uk=
X-Proofpoint-ORIG-GUID: fHI8by5H-ULVEj5r5eCTnvroEjUds5fl
X-Proofpoint-GUID: fHI8by5H-ULVEj5r5eCTnvroEjUds5fl
X-Authority-Analysis: v=2.4 cv=OYkNnRTY c=1 sm=1 tr=0 ts=6ac62f46 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TEv5oFMQsD92tgmXscwA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070046

On Wed, Oct 07, 2026 at 03:31:46PM +0800, Shawn Guo wrote:
> NE_GCC_AHB2PHY_CLK gates the AHB2PHY_0 bridge, which fronts the
> USB2/USB3-DP PHYs, EUD and PHY_REFGEN_4. It has no consumer in DT, so
> clk_disable_unused() gates it before the PHY modules probe. The PHY
> initialization sequence then never reaches the PHYs, and DWC3 core soft
> reset times out:
> 
>   dwc3-qcom a600000.usb: DWC3 controller soft reset failed.
>   dwc3-qcom a600000.usb: error -ETIMEDOUT: failed to initialize core
> 
> As a result, USB on Nord only works when booting with clk_ignore_unused.
> EUD has no clock binding and may be accessed while the USB PHYs are
> powered down, so modelling the clock as a PHY consumer is not sufficient.
> 
> Mark the branch as always-on, as is done for the AHB2PHY clocks on
> other Qualcomm SoCs (e.g. Kuno, SDX75).
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

With an offline discussion, it's not desirable to keep AHB2PHY clock
always on. Please disregard this patch, and we will try to enable
the clock from USB PHY drivers.

Shawn

> ---
>  drivers/clk/qcom/negcc-nord.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
> index 68ce4d6278ba..9c9b4a83df1c 100644
> --- a/drivers/clk/qcom/negcc-nord.c
> +++ b/drivers/clk/qcom/negcc-nord.c
> @@ -812,7 +812,7 @@ static struct clk_branch ne_gcc_ahb2phy_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "ne_gcc_ahb2phy_clk",
> -			.ops = &clk_branch2_ops,
> +			.ops = &clk_branch2_aon_ops,
>  		},
>  	},
>  };
> -- 
> 2.43.0
> 
