Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC5023E334
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908423; cv=none; b=Mc7pzjyEfpU9c6CtZZSaorZ4jxRpvKIrDnzBKQv4uG+BGhFgrtrmrJtQLNrlR5tM3S5dxPwU8t+F8v49jXJ2z8TuYIxbEFHG6HMkma2xkyIOjiL7STzzroEndk2Zceue/OqmxIIf9G5+vVEAMi5yx/1H6SQN6cVeCYBKiJZJC58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908423; c=relaxed/simple;
	bh=n6bYWBbuvYgd7Of4AkNGNr2HVdrMAtKaVoR0TN1D2LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RlE0/AQxFIWRPHOdnQVkzPmY1Wu94WfluhJjbbHXv0dkw4TH5yxS35OsEtxE6oBZEKGYy+FeTTThfqKZSZAX5qcmTTEmA3nahiAIunl/QMmwL5AUR32b/5KsghlcCZLJehe8THOb12fz/1ylLBRzp5M6yQEIQQC/ypbt91xOWm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fa1OArYr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa1OArYr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BAGGlX023606
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=fa1OArYrsMY1cNmv
	6U5JEBininEQETN0UrxidHl7XVnaDk1pndGlmoG23MCFUxED68xnDTNCSFHJIoSU
	ZIPwylxia739ZMNH8Q+CRQUzLNK+jVU9M9ux6Cvxy034AnLh7yPwJRzmMV4k+kT0
	1tqtXQl0X1XLW9KSZtgGRL0FmUFs9kNo2eMOVUzEzhQaVnNaOf+txkpqqpVJFLUE
	QDIsKSTgiY4a4JwpzbQisDLiDH3mLyYaeATtMFd8khcUsIKrsCZ42+Z6enisuDJY
	etaHEHFzHMotOcB+HuB7UIY0rf8xmx+IGGobpkQA5wxETZ5MyMyGRf08VgmHOPhk
	ZJXPMQ==
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem481ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:41 +0000 (GMT)
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e9055838071so603138276.1
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908420; x=1755513220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
        b=GJ0pil0FBXMjUNZE+RXYN7J/vcRd50cpAShS8xD3WSvh9iOt9aswBmm38kuUSrDLOQ
         Zk07KEiSEy/TNhEs07lLFqVihyPnqskR/s4LbjgpVpeaYhAUMRA9snfRpb6nWQZlxWCq
         LfZ6aBf9SxSb6CQm/GYUaoin2YvbdOh4z8jPKd71NVkeTUokFPYYRAAmrXp+w4bvmH8R
         SKKf6Qr5Es8MxpVccEdcqyy46BQl/efEs9vBugUj9w5SPn1tCD22Q0aejME39T9k8f45
         ggAVnDs/hKldVM2Av68axtaGdWRO54ZqfGOUdnSjzIL0YW4P1WYXYJLOqLQSI/Pwv1Cy
         FzOQ==
X-Gm-Message-State: AOJu0Yx+Crlfrs8+hMoP/kg9hEYCfa5CSXUC6iDBuRe8AWvGNv4XfzTm
	fZ0GKV32O8C9iwji4jjevLC9iZnJD7YfQQnu0r0NNg7fbo0LUjeHay7s9Tz4c/Co0F33v2awE3b
	fUl0E2XEBpSfb7zOY/bMSlcuU1WvS3ntqZBbBTMehf23S4vtGt/1vExdlTGZh5Wc=
X-Gm-Gg: ASbGncsybb2zGOFHz60CxdcPW7iSEc7AGN6vtoZdEXDsteR7XMIJH1GPuSpr2CqwQQ6
	Q60KcXYhn8+LVJlkCNuo69RS5pr4rUTe+j9SEZhKU/6NJCGTpfIJomjkZlxr5cgHct6ruJUluN8
	LwzPSgArTnKJkbeKDMMDKAtO8emXXF12ISPgfVDa4BYhYWa5bqNbi9jnvsHNwaz+VN4WlMWDaaW
	OyT7kiVnjCMzhOjJulPAJZyXkb+W/TnZ9Da1+TFSEC3ZfgS+7JgE7XHnBBO/zI6j9VOtKwl5q3l
	N4RwB5ROREoFZombjRztKLTOLEzawDXbHHDg2rlUA3q8HJTr0brBct5h0301I3JrGd/4dzOghW3
	aLYOqG+r3mS54GPwwig==
X-Received: by 2002:a05:6902:1105:b0:e90:569e:8a1d with SMTP id 3f1490d57ef6-e905c530befmr4533777276.0.1754908420448;
        Mon, 11 Aug 2025 03:33:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEntP1C0STH3bZ4zJOHqYgn5Z4wBvYvhRLLkeSBhIq4vihJkw/i+kzn7lwfCsqCq1ZHC74r2w==
X-Received: by 2002:a05:6902:1105:b0:e90:569e:8a1d with SMTP id 3f1490d57ef6-e905c530befmr4533757276.0.1754908419897;
        Mon, 11 Aug 2025 03:33:39 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:33:39 -0700 (PDT)
Message-ID: <238a18e4-43b2-438d-9ca4-886806b77002@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/msm/hdmi_phy_8998: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4Fe5Hk2DIA_FwlP1z3IqHDwi_8jzH_5p
X-Proofpoint-ORIG-GUID: 4Fe5Hk2DIA_FwlP1z3IqHDwi_8jzH_5p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX8eh5eUXqhkKf
 lzMrq3Isq8rhdWpWjIT6EQwNjJ9pYWWUhBWOA8MVSywV2/QeJHII9JIDBje9HRobdA1oZVdW0dV
 /c0tle+g5aq49Sv2yljgeo/bMDldTISqh+1RdWYxUOjCy1B16ob0bP63zv4UtVYf6OGc4WIiJpG
 UAjy08CFrA04AqxrkJhBeFhGn/G0z7VFkmXsY5teRuczCTnasc7kr45J9PdNjIX9jgkSjAUQTZq
 o9fgZfiUF+TNupMa/mQuj4EVN9Iw7hjjACwSm3q38AYgTHIggS5pKgBGgBAB0ZzslsP5Qow8Xyz
 bxF0oYkPdvyKe7RwMY/+n5RyMb3RIqi5nQGjxGyZyG+O8YEfqbsZOU73eKtPRpeh3vVQzWFO+uy
 DVvDKNdc
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=6899c705 cx=c_pps
 a=bcYUF9iMMBfaiOy0M+g+3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=4AvBJ3eyfGLrynxe6Eyb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
