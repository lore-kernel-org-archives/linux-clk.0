Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225E848A8C7
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329699; cv=none; b=FGpUfey0rBxkDzxS1yY9pj16+Rpa+a2k6JmwhA65jgHiVhFh8AB6oPbzP2IgbtX+8fSmvGhKzShjRD15IfJWW+5mEM1b000imBlSrdp/JA/7mSUs0kbPvC92bGayf27r+1nHGddW6kUkElY7XHiBOahFKOJmJGfUmUE9zbijnUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329699; c=relaxed/simple;
	bh=88IX1tmHXms+pmBDY4fQ91nC5iyYvEp++1JbnZD9ebo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuCgQiK7rOzmUp45Q1nvsH/+j7WJWIfpHDvzhr70bWLTszkf+Ue21xzh+e6yNr07FgPcqDdLawYCoftlJj94vnytEyvER0ehRTpGF4wWnidJqOcn+Rq9jFAyFKcU2qz6MQenvfMPbFn/kya8esA0LQv6gg+xQlRoK8ple3Zhf9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dse2ZHvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jC1a2OcZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dse2ZHvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jC1a2OcZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YVqM289457
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 09:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bKpKeKCtxn641s9Sq4IOPtWi
	CTENHPj6K3Ie8LJNauE=; b=Dse2ZHvmbRwKbQP7R+1JgOqw/uBIw700fb6P7xrE
	ddICyVpmtmwVTC0x6X3jcTqEf1wQp2D130IE0unoUC54pIPv9+eIRYW20gyenzLh
	9kUvJOJltqYj2j3r5RBktiMtXDaGB/JDeKKGOHovw3Ot7F8bqVi5Hd4zs9FzdUu0
	IukVBdq3eCM/vjYByd0LdPj90YDHoFeYFvn5bYaAkKLv8oAbV4gy7DKdfnVb+CzZ
	2qc0erk0CZpX2ApbzUWtNzL1WTuUQnbnE9zVtW3W3iorMW1hE5WKPPkVyhG1zG6R
	bU3YnPYYdeEihgT9b969GZNHyn6R2QgJj9kWUSwDM3PUsQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881tyxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 09:48:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso158192185a.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 02:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329691; x=1790934491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKpKeKCtxn641s9Sq4IOPtWiCTENHPj6K3Ie8LJNauE=;
        b=jC1a2OcZhV+xhhDUZPgT/zfsJVHS/zQLtouCzjWU/tmQDRnz2nmupewg1Ay+z7wwgi
         igYqRf0KCaYn4iVdWuHkTrCL2AWzcQEIWAlif7ujkyWksp+RvxzDrUiwK4dko+mjb+BD
         6xQz7w5a01CDtz0SK13wXVYGBm19S9mr+KpJHtHTXa8Ltioixm0OoFzRwogDZEQ1dac1
         xVhnFz4Tsf16yjeHeNpKYGrRn2jt+3FzlwWcQ08zWkxFEk4Kl7iAREqkvIHamT3Qn4UL
         zhnNJ72m7h4ufp2P8OKfD+bWLOuhHr7f3Z5bI7GzdKkl5llMGe87yUcmwRolrCuUVlpL
         ca9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329691; x=1790934491;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKpKeKCtxn641s9Sq4IOPtWiCTENHPj6K3Ie8LJNauE=;
        b=Lz0+mWXkf43Z9xPEM++dvvl7Y5LtXtRReQfVW3jFTXCbq+JUGE6mpdmpOBtNVe6+ZB
         m9Z9m8VftENq192hPWBIA7ctxqKVhDj6PKHVXgbftMkMV0Mmks5nrkNkEZbXsSIa9E1g
         HqtHXlKjo0XIlm1VY6+xUOvpj544dds0HgtqsDam+ZVYn5riXKkmbE1sHkQLMGaP4Pws
         xE1gtv1cvm50xd4yTk6S4r/XkZqyqcWoby8TPpTEEZJ4T6RLECbKButQp6i2xKAF5OZN
         tQFYVkpMZwmBlsjgP82D2W25FVFr+Dv+ihzpP+XvJOWef6UvUb3FdqN29JfUrt0sloNA
         M3Xg==
X-Forwarded-Encrypted: i=1; AKwUvBwtm29JaP6K/wXfaanUjZ1sMyXj9NN/ZiejMDleJeO5C98Y0s4fY9/xHovZLS/SWg11PQGIti6klxg=@vger.kernel.org
X-Gm-Message-State: AFuF++l6XgsfO8qsUTvn9TBy0Sg4Ho/tCaSL7PnQMnbjPVrAMlvDct+W
	S8lidanP4EEqrGHRPRhrt2ATVuVgfEg451m++HVNLA4eWvNzgHADmNhSs3NoOSv6Ltkcqf/MXQj
	sRw8zPhox671QzIuz2rmIGYMDivBHs9B1ifetSWEzW5iJfQoTipXreTS4vL/StZYvzIfbfdI=
X-Gm-Gg: AYBFou2UI3w2T8yitJ1UpwGgfpdQW9OWoiS/aNvfmABmEh7Hovydq96CP0IDFtVtpig
	jucyk4eH6dw7uJvCehOR74x813eicXKydqxwbw9vfGRaLnK3RRQpRyy7SCbmmo0KRB19Jl3aOOq
	6/2yESpLj3337NIVmDLaolIwEeOveVjUznC7GZk83TXA2WDWweRhLk3oddUyCzsGFFpMvBF3oKx
	iV4+cWr7S+rHmRlApEVbx06moGHJc0Tyi9KS5MGoEhpNPba++hJulxFzp5zrFAI6yo1fxw6PquO
	A+qXBCHeV9X+kPjYXTjqmuleCeV20zIIRyaVMYt1ZVEmheGjRX1mfJjclM5qVuueKfQcE+u8yo4
	kxJFmy1lIsImrZ+Q=
X-Received: by 2002:a05:620a:370a:b0:939:c7dc:8712 with SMTP id af79cd13be357-93c43c51d50mr347261085a.15.1790329691510;
        Fri, 25 Sep 2026 02:48:11 -0700 (PDT)
X-Received: by 2002:a05:620a:370a:b0:939:c7dc:8712 with SMTP id af79cd13be357-93c43c51d50mr347257885a.15.1790329690987;
        Fri, 25 Sep 2026 02:48:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff2884552sm29134755e9.10.2026.09.25.02.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:48:09 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:48:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add videocc sleep clock
Message-ID: <nwpxqyjjusepqubva4hsf7e2wfvvigz22p7yp6c2tblezz7qj6@2s2tmiggu2dw>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab6435c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=IINBPA3gYupw0c5GNbcA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfX9aFIYQmNdVN7
 8WI87ehhei1bffe1qkAc+s5A1jrp54EAKM/rQC8uYJactUv2/ct8KxHMcBmypyGesrnbagR7yn5
 lBAP+E4GoUU6DZk6K/0CXmOVcgm1DAlrEqkzbwpu+i+bM7E15jSbcANh6EKgIZF1J6JOv1j8FE9
 l2zhWo2hOLJMcCjLJLbm85ntD6zsEYJKZDRl7wnikkWnU73R+qcu72Y0rt337GDLOzd5zOwXODK
 ISQGWWqOUNrbl7UnJ6aeyj0CHj3r/9jDk4j3k08S1E8zkbKhNLzJQEdKYr7ldWM60vR5uvJdHcc
 515e7nwFzY6VzRcR7g8klXf3aEhihh6b37eCe8Oe5NNSW/uj79rN1yJrWBhjsZyelplXPae87X9
 wE+QTCuals0bjry41rGLqMZBXu5gtf5NxI7qkinfoJ/JbX+cP2RapPXkR3oi5MBLRkZnPwAj+5a
 +b6VzbBmJvRcemffZTQ==
X-Proofpoint-ORIG-GUID: 4la4qHYZZ0WpMttFOYiIRtuOLVBpbDYX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfX00gM8AoB5WUM
 rkrsLjMEWjpJerKrlXvOoXk3LWgMffS7kNefjGYqT6/NR/dAnDZmodly8gdsrz0bYZVqH+dL+Gi
 JfQtUVT6PGns512d3ri/tXLZhGgfE7c=
X-Proofpoint-GUID: 4la4qHYZZ0WpMttFOYiIRtuOLVBpbDYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250038

On 26-09-25 00:11:51, Shawn Guo wrote:
> The videocc node supplies only the two XO inputs. videocc-glymur.c
> expects a third input, DT_SLEEP_CLK, and uses it as the parent of
> video_cc_sleep_clk_src, so that RCG cannot resolve its parent and ends
> up as an orphan clock: any clk_set_rate() on it fails, and it shows up
> parentless in /sys/kernel/debug/clk/clk_summary.
> 
> Nothing is broken at runtime today because VIDEO_CC_SLEEP_CLK (0x8138)
> is listed in video_cc_glymur_critical_cbcrs and is therefore force
> enabled through regmap, bypassing the clock framework; the sleep source
> simply keeps whatever rate the bootloader left. The orphan still blocks
> any future rate management of the video sleep path.
> 
> Pass the board sleep clock as the third input. The sibling evacc node
> on the same SoC already does this.

Same question as on the 3rd patch.
