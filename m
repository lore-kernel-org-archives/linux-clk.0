Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904EE3491EB
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 21:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091776; cv=none; b=jSNyOD8Ea/rNgrs7NOmusFerrYE16Xi+HSs+mjRgwYLA/anGGnFdobKUNffV0Epi6W6xQfS5IviD3CE/ThKnOkDcNDM/a3IV0JxxR0AzCUw3nPe3Wuj0KB3vce4gzh0u3WZy6KTO9peOffSA+BzfWbVSh8C2856NMBQ/gc7VBX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091776; c=relaxed/simple;
	bh=ljgphUR9X1Vh/izCvxWX2SOm8Ub0mGUKyBUyj9XdvQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0qOFTArQ+8suEiDdad7E422hJWQLHfbtImGAd8Gyjr8RL3zQsJtrH4+HzzNds5ja9/XzSxB50VyeumJK3Y14WG7SFtlXLL69OtNqz80E5xG/+T2GE3Chr0s6cc4UnH7rJsJYmJs9sHMf1Kin1BQgxseM53/CXr+qlP6tQQo/yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZEQWN0M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jmy3vfli; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZEQWN0M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jmy3vfli"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629JFnjO2872736
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 21:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kvjt/VCxNbUheh5qilxfrJio
	aIJ8oJ2VYpYhdJuclHg=; b=YZEQWN0M63zvUPm+FX153TKEb/xjOgWrFZI7JpsE
	vN+Tzdqr7n4afH81+XElJ/vwC5p7duIOmUlqNgnJ7blt0pzXb7Vg7Sx04MeiaPnA
	n3BMaSYdXlm+Ul+qppUNk3hqsUw9uIzho8JDG6uj8hls42Ubg9icmwDurWUpb11G
	neUQu+wjvqX7+Elxu8HkvJ/EzNQbNHx5DkphhsfHYIrc10q2NV3B58OgQAkyg0HD
	PwuFE1bPHP/sbGeK6rmu29T/XwfRyvAV5V1X1E1xHMdqLMY2LHUT3xrtTfnncvMX
	Mvhlorb0+m/QB4cASC6tJlXPLm670axxe2F2IITNQU/pkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477gcat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 21:29:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd91c0262fso335621985a.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 14:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773091774; x=1773696574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kvjt/VCxNbUheh5qilxfrJioaIJ8oJ2VYpYhdJuclHg=;
        b=Jmy3vflimcvT+7f1uGLVAFDV9g1QMUISV0SzzyGkv3NPyJhjjDW6Q8RaCKHmWo6BoZ
         i1i7pb0jwK9wSUTgTzSfFfakIi/owe3NTNj66yXQf8SFEJc43a62oIZbM/EFAwY01Vk7
         c1gQ5UC535jw9QPuzDSQupJ2ehYAiXdeseQJzh5u2YJhrbKPLWmaTGcKKvEENH781RUt
         Tma8JwWPy4YMQArY+FB387VilmeeMNfl3kv7Ktwsjv5F2m0Shzvie9baiSPRQcXfXbWy
         PmIC7kAhwK+yADIwoNjlLXWsqRog+OMAVZA2zzoyCmp13VzNrwBXt19xTkCmuoYU5LXT
         aHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091774; x=1773696574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvjt/VCxNbUheh5qilxfrJioaIJ8oJ2VYpYhdJuclHg=;
        b=isPA9Qz4oMICW0/Skrb4R4rdWIMjf7QmsrfIr3fuhzE5//JmQAfJGI45pfAr4gzAqG
         zNZOA5GJmxy7O6KOS1lzOMM9c7QVs5oOGDyEXrs+p6aT5CFFb9K738/bGM3WEDAty68e
         d7c6Bow2QypE+Dy5L29x14o43JtXwz2IuhV7OsctRZ2VCzWCZe8PQogBoTfotIK1LzA6
         XEhfRt6URoNc9A5Qq/DKXu+Aej31cjMtI7ARy8X50WnYm061r8EufVB9QeAMvWQTA4bl
         kMbBqT51npcA6+TGC+4TIvb02tbSFtJyqJZ7qSAn3lbL+02Cudf8T2pMMniJUEXyWcCY
         WxRw==
X-Forwarded-Encrypted: i=1; AJvYcCXPV811I011kOANc9h+7g3Ubf2Uu9eHMO163aYjcybG7AsnOL1TvQ9Ve0J3RyTDoawnDA7Egzc3fps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVUG8enzmFnw5THxG2ctP5y8Q8/CUgOUUDIL5gGF3hUMk/4uhw
	HkVGEYiAV94u0Ab2xLWhezA/YEFOMUgo1pUr4TuDu8jDlMDSBnJO9TacrSR+wH3CYI2QesAjqQc
	ewHQ+DdShF/OjUMnOxn48Eb+PprM2QhIH+/Z8dKz2JrUyom/fvnuMo9fsrL30vwQ=
X-Gm-Gg: ATEYQzxkXjDFl8uootTEwarD9yfqpDQLIlRH4eZ1uPU3mPjZ8xR1x4sTAuMIWLcBKnp
	8CI2p8K4WxCtQaUKcv46v5zpGwqS71GXP5c97ooU3Jj6unbnBNMbsVyTZGYmZDpUXeN6ahPRfBl
	k1eqsWILVC16UPdotxlTst56ZgTVLBVHE3NUY44HV7yH8MQtcf18YcSyjM/8dhIJjUm8Wx0qo7S
	EZ0DnyYAbZEfZEs3HNbVjekESmsgmgcGVp8yB66YxknTdTSFFDD8qKgMcdUg7lBsBWr1oYR+dPI
	5WIZYgrl2oiq3TAuBZkMsWQjdNEgg8a2pn4pKcfCaAA9rY4oQIBKiRzhLY2TYEZxMEVpdBKizjM
	JswSP+L97R3VpVI+7xRrIDawXjwYhDyzCNebfaQMlDTbOYxqLB5M24cJDV8nQNw1DxQUGMAiLW8
	DmqCvw2A60VI6vLqWt+8y5+4SPzJVLxfsQi50=
X-Received: by 2002:a05:620a:480c:b0:8b2:7536:bd2c with SMTP id af79cd13be357-8cd6d52fe57mr1447416185a.78.1773091773775;
        Mon, 09 Mar 2026 14:29:33 -0700 (PDT)
X-Received: by 2002:a05:620a:480c:b0:8b2:7536:bd2c with SMTP id af79cd13be357-8cd6d52fe57mr1447413285a.78.1773091773309;
        Mon, 09 Mar 2026 14:29:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d072365sm1487521fa.40.2026.03.09.14.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:29:32 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:29:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Tie up the CX power domain
 to GCC
Message-ID: <cm4wf6igasfsxvk56nirrjjrrri7bodyxuzuutqqgj3qvfz5xx@nblooxxxfobr>
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v1-3-f682c82f116f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v1-3-f682c82f116f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5MSBTYWx0ZWRfX5Yb06hbdx6bR
 VVC3OR4r+oeuiQAcbpWX0OWaVwhtp0XMuf30K5jM1mku++iY1BD3N+ha3zwQxiRmVMH3CDW8yQH
 NmQzF0mU6g0zTDL+b5reWj5CfwQyGVBU+r+jubYGCMSgAY+lBeoDzI1taAY0y20creg6Of1lPkM
 3cFt9VFB2IxVq3KY/cnus7w7oBFvd2fwKH/H4NlneR7f0o21YwUGR8bZs0xUw/4maWHwhY49SAn
 JJA2GYMIiH+RzzwvjEYismV1xjrrBcnSs6VV9To7Bdt/6AhZ1RJLqbPuUnkBEIR1Ivp8Dwx91YM
 nV404O7mV7VDYmUckxjlR2korhg553ZIYaZClBDxnUNdyaE1sYLqtWIp/26HTtc/chVXKEjtKsM
 4lg7yCGricQF0Sz4G4DYtKT8UdlxlHagcJ1O8IitEU0rULfQ7gquhmSqM7G0m/ioxNzIVbSxOnz
 Osw8aLJ5AvZmsws0muA==
X-Proofpoint-GUID: iLbHX2l_XGaAzaksqFYlUZuS7SaA8qVX
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af3bbe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=XFCnTzhwHPFgJtnojrQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: iLbHX2l_XGaAzaksqFYlUZuS7SaA8qVX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090191

On Mon, Mar 09, 2026 at 12:06:19PM +0200, Abel Vesa wrote:
> It has been concluded off-list that the Global Clock Controller needs to
> scale the RPMh CX power domain, otherwise some of the subsystems might
> crash or be unstable. So adding the RPMh CX power domain to the clock
> controller which will result in all GDSCs being parented by CX. This way,
> the vote from the consumers of each GDSC will trickle all the way to CX.
> 
> So add the power domain and Make sure the required OPP is nominal.

WHy?

> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index e269cec7942c..2d1ffbf53730 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -764,6 +764,8 @@ gcc: clock-controller@100000 {
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			required-opps = <&rpmhpd_opp_nom>;
>  		};
>  
>  		gpi_dma2: dma-controller@800000 {
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
