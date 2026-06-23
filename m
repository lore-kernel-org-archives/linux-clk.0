Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7A037BE7C
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214624; cv=none; b=d0MQzpos7HA5vMpQosV7i9m6f3A3ovoWAjzUYhrx+Q+6Hbfk76lJS7Zb1GSrjJPSLIUYtrJKnwKhPmYprGGgzs801SnCyjG07UvBTz94zh1NtWXVxoUQK93Xf+u8Eq4C1ESVqhsEsRMO8LI7RN0D1kYgvEornyRvaxUOsF96zSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214624; c=relaxed/simple;
	bh=aTuVaf0nYfYAWfdJkxo7EvxAlbxCaffxQrDNMK/QZvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2BER96Yd9zAaGVqPVj+vf9/N6cL5DALHQGDfScleQs/DXXex5H/E8KPQUnaO5XCTUiskFnsUh6xh2LBObWYQ6dHH9ISS+4tkjPjOSNeEO63HzuVX245QaKD2GlSyKQUbhAlGSohtC0GppRM8kMk5iajDaD42HHnVbe4YSoHvx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OetdD04s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhqI0p0/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OetdD04s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhqI0p0/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZL3v4017099
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXNsvpmExzEXM1J7XKQU25avjaUjuFbYf81y6omDQEg=; b=OetdD04sMT8BXOHl
	P0ZfY0xGtL2vRhpknWkdpuLX31ixTvC6kpV0E7VQdx0gj/pE8GCrCnomrMVSoU1+
	L2bCcW3nQ+aUWuIXihofuZXtk6g13KrVR2/2baRhAnB8pdxL1JML37cHNUuDwsL9
	5MVe6YTHbtX2udMawnrW7aZgXiGhpEAyN2hDgmAJLUOFX6tzvK3dZK2DqvRnWAbA
	ndKWhmmmPYlyDqb7nmieAixUTjlWqAOE0oPFv8GUUkOsTpEFyBJ6bbgzJ1gvoniI
	XyL5R7akeITlahYsjQv8hfHbBlRRM23j5kPYYklFHNfS/zERxNBB56rvyaxkX1YF
	GewvCw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjj3n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:37:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517647fbff1so17285171cf.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 04:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214621; x=1782819421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MXNsvpmExzEXM1J7XKQU25avjaUjuFbYf81y6omDQEg=;
        b=fhqI0p0//S0ptLFS9q3SPgjA90L49YS8l2fOw8jC5j8LgGtMLdMKOAWZ6iT7/yZ4pY
         KqEbAQdVTqCEiKx5pxur0hNuQn25GetIndI9QLHFyaWNmw7eGbVQPHRlnXEjCTPGew5k
         43ktsIg4f06uv/jCEG04lVn8/BWElrFgvGq0Kst9Wuot33QnqUbGP5QhCHAvSKep+bxA
         qB+ndilPmKj/600u6wbeZTsLU6dIBb+QmGixrROXRYWyqW8KfvJdFtZSJlhd3FRNccwx
         3acF8jbosGBQ31sPp7yVY4DYuJWILNuXhWupEfAJ9ulS4euKMbuJY1Vntrf+IxwllmDQ
         idPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214621; x=1782819421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXNsvpmExzEXM1J7XKQU25avjaUjuFbYf81y6omDQEg=;
        b=iPd9AakTv+f/pmtGVqH3N/GV/dVzcdVwrDVSjO/P1E7GFaDRzp8hJ/6y5cOXTeAFKg
         qoixY75BSCvnHEOjvzlUKbqd5+c5S8rKF93rEMwVew9I1mGE9Xxk8dDg1Q93U1EMlyyl
         ipFqgYLC4/kuxRUG/kPPerCXao2uS0yyjqz9jG4ip91Rmx1QILDA6+AL1W/UuyJAfRsd
         rI/GLCp9Cy/NZgX9dRcp43iO9+yb90/KpK0NU9sNf3trdZKyhxmKwsMoP+rFrv8VWP4C
         uSlSMDjBozNeTLOnQ5nFrTkJbgeypezUtcxWlue0EaukWWqxyU83Sw18UdgB4Zap1ONk
         6mNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/rF4gnXpSs+LQaP83gf91qfIQGiVSXne05FkOKWveoQXYpD+z7G26oLoPokSEcBx/XxlqTHxAd4U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+T/ZwW3yrjNV5VmBtCOlci8hs3n3WyjPLKLRtne2uu91gFBZb
	cA9Q99tgb9zl8XDRF40VoiE8PjNqenbqBfKEQoiOZDDk6qK0p5NieyXmp0uFN2MVnu+NfHFLy3P
	6eP94aFoZBqWQb0V6tdkBbW2nZ8yDjVyfUHld+cPl1oOEba6mZUkvxjlWa/q0ZAI=
X-Gm-Gg: AfdE7cnk6Q6VbHSzH+PgUuM5GkBwwp0tddAaaMnRml6z6JFEwcNlrox9Rk6dY4VT5ch
	rHLmZp+/peQUTDAPjcYTqaxYs0S8c8wg/MeBoNV52NBL57zZX4vflQZ5cNrQiD7VM4eFAQPh+lf
	rTQaJsaA0v5MPmcnq2Lom9/geCI7dlN0NOV2I6z0nE1p3uHvh3PP1D7iSXooxP1B3xXaPtecpql
	4nRb6wIj7pYEbcMBTzQ3qcVRk/h5sSTFK5EzMqQGV+7j7FW8IUvIo0pc7eXIfdu3BAIN/3Ll3ng
	U54zoKWqOaYn195h0+O0Nob9Vy12X4wdS03kVfOcUejpJjhIoKr8BXTVE50k2hDo294yQPe+pM2
	3rEqpugmhmRoiOesz0MXiM4+dEtMuc3EEUKw=
X-Received: by 2002:ac8:7d49:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51a4f380d0dmr47487451cf.0.1782214620898;
        Tue, 23 Jun 2026 04:37:00 -0700 (PDT)
X-Received: by 2002:ac8:7d49:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51a4f380d0dmr47486981cf.0.1782214620409;
        Tue, 23 Jun 2026 04:37:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be498e4sm4536670a12.20.2026.06.23.04.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:36:58 -0700 (PDT)
Message-ID: <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:36:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] phy: qcom: qmp-combo: Correct pre-emphasis table for
 QMP v4 DP PHYs
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX1KLKvP2ygfmE
 8sZ/EQLQppmQxX3P7ak1jHgcS2fT1QzoYrCdJTvsGEE79sT4dGam8jzdChitbRsi+YK8oQzJOPR
 mYNJXGBL2duxK5+QD1BGdPj/0cE6OqqqLFaL5i+gFNdwcAeBz9pTyuZVBGCLYWfLUc/8EntvZvT
 jumkIm9xW7Xq4vyAYGQwTU8wgXNsDb/x9DuxEJ6yfVaaVGxW5ST5JOVwzpm9fI1tOY140xK1R+q
 3oq4/PPT3QmKgV0aoPv2XNJFM6dN59p636pGQrWyINYXA1P3u7Cuhohv2LMQDuFYoRHv51eCe4n
 q9QkzkO00W90jknnMvi5C0FemK3lpGIBT2TG5KUethXsKRud2rQsA/ft+PX9uyDQ0saRO0nRhdi
 8q345Cq3B06c+YyQ7ebdlSIHTxbMVXHZC1ZlOapF/PNFFiFrGkYBQUdFfjEpD1xUiouX7/e0AyW
 wI3FHnb0w5nySN5rwIQ==
X-Proofpoint-GUID: IGTtkP-Eo2l1OTsWQfzCJqJ3FpjBCV00
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a6fdd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=N-WSo6sfiX0bQk_JYPcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX2kyrM/ObGaBC
 QibP/3QcL8+Qc4BNlnDqLiMZFZUp7aL7NzQailrGUnt8mtwpWVgmWCxDGzoKtZMC45mkzSdajOA
 pHpNmsFEncE7zLKF9SM6TxT0mCDtBNI=
X-Proofpoint-ORIG-GUID: IGTtkP-Eo2l1OTsWQfzCJqJ3FpjBCV00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230094

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Comparing sm8350 and sm8450 tables, this seems to be typo.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 9bd666ac2c49..5b278fd54a16 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2108,7 +2108,7 @@ static const u8 qmp_dp_v4_pre_emphasis_hbr3_hbr2[4][4] = {
>  static const u8 qmp_dp_v4_pre_emphasis_hbr_rbr[4][4] = {
>  	{ 0x00, 0x0d, 0x14, 0x1a },
>  	{ 0x00, 0x0e, 0x15, 0xff },
> -	{ 0x00, 0x0d, 0xff, 0xff },
> +	{ 0x00, 0x0e, 0xff, 0xff },
>  	{ 0x03, 0xff, 0xff, 0xff }

It seems like 8350/8450 should be using what this driver calls
v5 tables, with this fixup:

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cdcfad2e86b1..63a4f2127e3c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2134,7 +2134,7 @@ static const u8 qmp_dp_v5_voltage_swing_hbr3_hbr2[4][4] = {
 };
 
 static const u8 qmp_dp_v5_pre_emphasis_hbr_rbr[4][4] = {
-       { 0x20, 0x2d, 0x34, 0x3a },
+       { 0x20, 0x2e, 0x35, 0x3b },
        { 0x20, 0x2e, 0x35, 0xff },
        { 0x20, 0x2e, 0xff, 0xff },
        { 0x24, 0xff, 0xff, 0xff }


+Dmitry please confirm

Konrad
