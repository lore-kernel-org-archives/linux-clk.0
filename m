Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440643;
	b=kC4ncgslYpOo40lLazvUGq5J5XN0ICouGXPcfr4Hp2Bwgc6XQA5jujvN6V/4/Dl5+cCx
	 ieUBSKLRQv7EuUklewWlJnQvpcUhrY43KRLi6fOPj16xDwlv/8/D8QO+GEkgefIZGYHMO
	 3yYfS2KFx4oC4zEp/PDWKis6q23JZ5/DMZt7JEXAFJCHncZ7I8zrmBoLzqDSm5m8DRbX9
	 g8NYEWo90yVXhuAr+NSHwDodE4pcSkcVOdr19IrvOv687FigZWcFaJGhXM+pA6BoieuP1
	 1MLBUUJG6DCX1bCvmrhE4oEuePLC9R1NsxouIWuUUcWQ0CnWqXIL3+CDvD2Qm7jNkLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6GW16cYLEXbLEKRxCLcZ/hm1ouVgqsdPZ8UneMsZf6M=;
	b=f1SAuqe3GE8mNv61lEC6YuwsKbTdGJACui6IzDwVEo0gkJjFTrRgDEiwtBjIz1bq36le
	 3rUm8CLqtT0LJEdbt580eGzrc/QjJB30ZgXjpQEq4VAj9uPWaTfhiLS9eVfsPjePnnVMc
	 S1hcSyzLot4+pDTsoM1e9m0QS7/hEyIbSv7T2rIkeb++edhqxLSbi2OwECNaX8/j+sdT+
	 tO51OV5gfU+tttVAzvD+4eJD5kAt8kKdio+kFB68txSzev7xlBnLgmQaEeVn4PtTHjoTM
	 EELYRLLCxnt3dvutTPWJLFVGOxsUBkSakapYwcYXDF0byxg453fpDzjfm3Ca4SNkuwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c6TAGOg6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gEn7+k0A;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11028606A32A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 13:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11028606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c6TAGOg6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gEn7+k0A
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKu7J1974182
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 13:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6GW16cYLEXbLEKRxCLcZ/hm1
	ouVgqsdPZ8UneMsZf6M=; b=c6TAGOg6zi0O5kcLuEuN/zocBSDmqajGdyt5ZKdp
	JFQcnRh4jGqIi+JgJm8LtbWG776NhXnFYt8IBDEHEWhlq8tGnCAvG7N4gjx/fs0g
	RwHLHAQ0AzKISsPBHeN+T7sgGPzfp8mpNfUmyAahFVHjGEuOHoNy3R93Ypgji/1x
	n4pNZrIEt+skItajBuFA0fLd6AE16jE4U/KuS3s5WAa8MHKNEOwVSL6qotCUiUp3
	3+dwTPk3RXdaFMfmjEmBqkTy8QrljLtE7P+E4n+wCKsGj1qZTeLYJd9iiTnTunK+
	jzcavvfDiGJ0pRTcooPH0jqLoiD8wvpfK4VnnCpM48Fu8A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7urget-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 13:30:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc01d48a1bso3116541137.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 05:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795440641; x=1796045441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6GW16cYLEXbLEKRxCLcZ/hm1ouVgqsdPZ8UneMsZf6M=;
        b=gEn7+k0Ajaze1vGjd+9YvxrKbxZoK7CwlUziaxShMn1c1qP+qCqUtb/j1rm28nqQwA
         Y9G5KJT2NfLeCAnij2TdjEKJIlympH/oaHji3lp8qBvgVuVYWyChaRLZx3sgT9b/PTxc
         p8bet/RyeZCRyBoQfYzzX3DqVwMXDZem3ZR5VwaUFIOZrvkY/hFrNuGiwU2M2wVKEbI4
         wbiBBMC1OHIN9icmt0OZTzInNPheC04yokttgfMsx8FMab8/NfGzDw1lhVN2Xcg0uLJe
         xfggIo2sp9rX4uqV5FsyOO/MC8rRRT+p1B0R+FAdNWA5HjiqZ0ahuRMDE0XMy4DBiuxa
         i9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440641; x=1796045441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GW16cYLEXbLEKRxCLcZ/hm1ouVgqsdPZ8UneMsZf6M=;
        b=BYemlAbym2hpweYzzVDXQA4NbH3fnORh6GXmtkOWYujoN1FAKS/bttSAvtAy4G9pyP
         c/rp2+yaUzl8q4Yum8dS6izCkYYll22HvZqNukDnoUNAldOe+Ka/Acpv0h1L2iwXQyZ9
         ET28CywOURiV2EP8SeZsdev+rebrQ/Y3XVE+VOkM4UqKgQIuf5yll4O6XX7Ck7ENBa+A
         0IfSAlfcWwDndgq2ZVbg5x5R83gbKHt+T/8xE/fKYMq1McXExJI0d9NxIOE2fTxTcwbn
         wiSs2k7NQ++ZwVvR8pZNNXYDI0rYoZdgFKTrU6vLK4aly9tKvl9oFPqgrMtQr8JiIMhN
         +peA==
X-Forwarded-Encrypted: i=1; AL+hErFAjWA4bFO7PL+zbw0T9h/KWdDlGAn2xkr74Ekrz+c1VSP7BmMsoOAuWNjQSJ+vPxsNYRmmgckbO5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QnkTY0ubY4PgsOC+ug1YcQ8vZKfKTlcz8TQ0P4LIkp+67Ow3w
	AeVnTZoZSn/k/FHh+qmN5IPm2xhCczx/5IhLOdrXpEKFxywItGItIGsRuWm/PmGnTMnD3kwIhyj
	SaWpbygiCtSzWD81I9BmNKbMmFo1FTsng4bVQ8u9YJn0JsvJnksymqZLQxKkGSaQ=
X-Gm-Gg: AZFdTZfI3/QcGNOCSEy3nlrwqHT3PWsDPGL2Q+6HRqk12XwjqCxq+qE0QS0Ixs+GIT/
	grFVccgCy3cS352tqixghmijl0E5symE7PuWK3co/M3skDd9TBvJKkQZhlImMO28rkj8Q8gBb62
	/LsqFd6mwS0VlBnwt0ydggMlDQuIQaOMlTJN//ZagSxjr8c2Tdt21/rRm5noVVyZGGLu4DZ56lN
	IBHZEXCxcbk+EQ3taggWJI1VQGufRrUUMj1K2+uq2EUB62CPEHgw2bP4G0eqpBzoEg0uZWeKqPg
	mHfaa8RdlxJFFaXjg7mPmC+HRrSdEZAxp8IYu6jOdeUIQNWP0JFgnO+tOM/8L4toGy2XhOIo+T+
	+dl1w2B5KbF1NZN6c3DZYBiOZObTt01itLpi6A5fNUCGBTO3uN65MnowvW5UvteycoprJIG2rey
	mOzsWz6zMStYBnoaI=
X-Received: by 2002:a05:6102:580a:b0:7ce:a840:e736 with SMTP id ada2fe7eead31-7d739626308mr3388886137.13.1795440641109;
        Mon, 23 Nov 2026 05:30:41 -0800 (PST)
X-Received: by 2002:a05:6102:580a:b0:7ce:a840:e736 with SMTP id ada2fe7eead31-7d739626308mr3388860137.13.1795440640566;
        Mon, 23 Nov 2026 05:30:40 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7fa0467sm11903416137.6.2026.11.23.05.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:30:40 -0800 (PST)
Date: Mon, 23 Nov 2026 21:30:31 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: socinfo: Copy new SoC IDs from bindings
Message-ID: <awQ_90R8_uGWm2Sz@QCOM-aGQu4IUr3Y>
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-1-eeee0ffa25da@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-1-eeee0ffa25da@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 573g6UeF5Vt7s3h-hRhoM11HnfxI8QOE
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b044001 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=votV42V3uHCFBabA7mkA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 573g6UeF5Vt7s3h-hRhoM11HnfxI8QOE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX1sXvcnYiN7VE
 4BHNGicg1kZIpqyFceQrNhreKeSMtgLZoil0Z4FiO0574GoYgDmUckGGp0mIps0yCVbz/6sMVR3
 T4bSKP5Cnl2q/jB87QGo5OL6bK261YA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX94TsxDYdSTXb
 osE7H0TZsSJCsMYmQFqXN+JabqoG1g0f4aIsdCvPtQRtHsJxieIhA2BMgulh8WZYfeESbkKkXQD
 w6zx/1O2MC8E3C+dqIP/a0PqBawvTaOv4E390FPc+UXLW1qOP5PtpO4eQ594HWENPYp1Dzxk/S6
 7hKCD/4t5BXKEvaUIV9uTp0u49u/3bBkbz4ApxDJmVqrZyAVEfErZ8icE/aakHiMj7mEENYsHGk
 JqHYVicDbb/IVOFmJmXnS9Ad43kYQLFATWEL8gCoJ+nfhN6bQ3LJaEt622sEvpVbZtY6+cIuobF
 fqjm35Ep5N1cuoJJDiChR8+XTO1pXU4R8xIsEVyEgeyVyH4mm2AQoJDdUwIihMrGbdQAqGycSla
 0YSH9NohSuAxf3OZ2OQ1GNTAHlX0pgiZXDdlrnC7U5Zp3GcpXPF+FInIaTob3ldKCBBTJNiqUbZ
 5HgIccc3LHMoNJ/STKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230053

On Sun, Nov 22, 2026 at 06:46:20PM +0100, Krzysztof Kozlowski wrote:
> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
> currently used only in the socinfo.c driver.  There should no and there

s/should no/should be no/

> is no in-tree DTS user of these, so none of these constants are really
> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
> that part matches the concept behind DT bindings.

Not quite true for the start of the range. The constants themselves
are not referenced, but the values are used as raw numbers in
qcom,msm-id:

  qrb5165-rb5.dts:                    qcom,msm-id = <455 0x20001>;
  sm7225-fairphone-fp4.dts:           qcom,msm-id = <459 0x10000>;
  sm6350-sony-xperia-lena-pdx213.dts: qcom,msm-id = <434 0x10000>, <459 0x10000>;

So QRB5165 and SM7225 are still consumed by bootloaders through DTS,
which is the same category as the older IDs you keep.

> Copy arbitrarily chosen newer SoC IDs from DT bindings to the regular
> header of socinfo driver and use it when needed, so later they could be
> removed from the bindings.

I would suggest converting the boards above to QCOM_ID_QRB5165 and
QCOM_ID_SM7225, and keeping those two IDs in the bindings. Then
the in-tree DTS users become visible, and the cut is no longer arbitrary:
everything left in qcom,ids.h is an ID actually used by DTS.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/apss-ipq6018.c      |  2 +-
>  drivers/cpufreq/qcom-cpufreq-nvmem.c |  1 +
>  include/linux/soc/qcom/socinfo.h     | 94 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 96 insertions(+), 1 deletion(-)

[...]

> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index ba823a0013c5..cd2e8eddf3b5 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -112,4 +112,98 @@ enum qcom_socinfo_feature_code {
>  #define SOCINFO_PCn(n)			((n) + 1)
>  #define SOCINFO_PC_RESERVE		(BIT(31) - 1)
>  
> +/* SoC IDs */
> +#define QCOM_ID_QRB5165			455
> +#define QCOM_ID_SM8450			457
> +#define QCOM_ID_SM7225			459
> +#define QCOM_ID_SA8295P			460
> +#define QCOM_ID_SA8540P			461
> +#define QCOM_ID_QCM4290			469
> +#define QCOM_ID_QCS4290			470
> +#define QCOM_ID_SM7325			475

[...]

> +#define QCOM_ID_IPQ5404			671
> +#define QCOM_ID_QCS9100			667

Since the list is being moved anyway, this might be a good moment to
fix the ordering.

Also, drivers/clk/qcom/apss-ipq5424.c includes qcom,ids.h without using
any QCOM_ID_* constant, so the include could be dropped while at it.

Shawn
