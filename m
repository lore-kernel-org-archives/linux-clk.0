Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D54F35C1B6
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771843822; cv=none; b=OtBdxYsp8TwAxXc/p7NPTOSC+KuYnC3CLKDLtlK2G04w8yFg9vGMlftp3dOKWikznhC2iqTeO+TKHV0Ix7nsb+nP6X2SUGr6tDrIdeyV2s+lsWNxxE0PXWUf1Yy20NyHT04fxSRBKIngH3zSISuYFJ3v62dIRwj02nBF85SI7vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771843822; c=relaxed/simple;
	bh=dSP+9h330NFEIksoIga0TIptWItXAQHyk0hhGWOUznQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQ2UsHTyznkTqNH0CDeK24bSL+UGgP7I8wLz1r3A3awomECvQYu8isV7L02qVXjAIcKKCKGQPqR6nF+FYAHvaHTPvJMktNY9LXep3d1PnS6lwOtLMjka8C37Tv03jfdTbqTiCPE+K9H8UcQ6J++sZX5R3eq47hKEZ6/CTrAULpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lo4j5Sbh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7oV+ihM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lo4j5Sbh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7oV+ihM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9Hr3w1430720
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 10:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G6mqx+1LMT2Uz1tlKLAVBpKh
	BRzPdww9mSp6+0/ywwY=; b=lo4j5SbhuGugClzTcLyIvVLCd5A57MuSyQxDMyG8
	pbvyqY0IWTypYu1WZH/ILmgQZwlhK15pme+LBGqgijmlRWvIYIvwArSizuQbR/L8
	8kXSEuVAEjB+WqsD965HRiMoKydt6Qn6be76ztXJr1z3XgabQlYswe4JfnfBk2ak
	7pLJo/AhTCoSp81fqT6W+Z70D9/Nh01pFdivsPKQMsA8yZO4Xlx4Dq6J9b4YWych
	jGhxYGfKJlLeU/35aj6CwwbdsQGAnj76u0F6gWFNz3agSB9s3JQ25KQQtFa9JITx
	XIp9WePDc7u1hCTzDZBA4iOZw4kbRP+hfCS9DUcQwUniYA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7veaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 10:50:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4b8e9112so369524585a.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 02:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771843819; x=1772448619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6mqx+1LMT2Uz1tlKLAVBpKhBRzPdww9mSp6+0/ywwY=;
        b=f7oV+ihMPEFpW2HjArenZOQYlwQdF++KidGwTN3p3leCBOGOQIKsuyNj6EjNh2jZz+
         y3MQ0dk1ft8ZZw04P0mRHUB8JAl3Yc34DOkdTAWmIHOoolQ7Q2609ECEIMrwJo5fvjNL
         76P7FVnbTR8M5vkC2VOyDpJRmoT4ousElj1FBasDxLXjT+9LCfCNiaj0dPVyZ74Rl2+G
         IZ4gg0CkQKF/SXt1XWo6ELysJqwl1ZiAp7A/VDbW/G4b6gaHBZEkFoKvzdv/Fzzgp8vz
         j+uW7dPhClS+cn+kEA2PQyh/LaThBc05Bor4C6+ff9sSdEIwSv5tY1IXMfrY1JJrHW2h
         I/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771843819; x=1772448619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6mqx+1LMT2Uz1tlKLAVBpKhBRzPdww9mSp6+0/ywwY=;
        b=YKxjiMy8sMgmx9lukhyzai6h1IouXAbdY1SuzxyAoY79R8rdNESqJsvBc+F+8YCG7u
         PKDMUaYAVSkeffsi3YWNxw1pLesQv2EiLWUMuRmT8aWsIyt5O0fv3ULySsonLnyJ7FQF
         MKQR3Xb8LKR3cMHun2pTxXvCg6DFzUc3A8XXrXOWCSr/1Zky/qWG1whPir2y/tjIyWo2
         2NvPFI7zPhrdB/r0wWsncc8BTpnnyOOFzAxqtniWTlyH5bd1v2Z8uUXpA6wmCumAxLzA
         Lz0uMT9ql30rzlxILbbPgZV1crwWA2/xjYari/Xnly3/VhjOuff64WSpm2aoLjuQx+Hs
         mQJw==
X-Forwarded-Encrypted: i=1; AJvYcCXns7rucWZRcZvm1ZpvFoI5dmKd4cmCYTSXxsZMIC68gbO3qf+UP9EYwSyU3PAyoBU9/Pz3mUKQW+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwawBMa5pTPQDzv56yND5zba/aMwCDKD44ikQxk5Y7tCTJy/o92
	4PVnrBnBkaMDN6J4BiclhWvTGKsi7y4laGncyQLzjCJxiUSMFNwraDdu81JtK3pPfRyN/BEEsaZ
	uF7C22gQJSRXdzaaBNBQWGQGGKf33E6KdgJLe/0FaQOHzzi2jiy81//Th/WSYt6E=
X-Gm-Gg: AZuq6aKi9buLanvFMnWloQYlRosjrCDYpS8Jvi2W65bftLIuLot4wcrrr7c1GRD/YXs
	8QUi0lWtRv3swFfWKL6EYkThCjFu0B3guTs1EhH/iKig6y9RKmzHc5fDI7K1BRjEN6ZTYriE5WC
	0VtCKAma6d4v0V0NJNCG72xDQr7QMJdfm6tZjQ1Jsq8RlQa0RoWpKX1tiSZqmpuMoY1Ld0+rAHD
	0Z5FJzh3Jg84E2PIdIP4Bli2r0STkZt7V7A19hUHhPPxirgm5rXOQ0vRcX0gLEGob9+HYtTpwop
	GI4nDCm2sDGRCAWD0Brw3+wPxx9M5zefVcOIM2DeF0oq3pF8ICYDNW4TrtyisLO8cBtI9X6SXql
	T9bvpWwugAtC7Nd6LiyGtwtOCtsndEx0b14Q4
X-Received: by 2002:a05:620a:3706:b0:8be:dd2c:a0fd with SMTP id af79cd13be357-8cb8ca66084mr968354885a.44.1771843819208;
        Mon, 23 Feb 2026 02:50:19 -0800 (PST)
X-Received: by 2002:a05:620a:3706:b0:8be:dd2c:a0fd with SMTP id af79cd13be357-8cb8ca66084mr968353085a.44.1771843818677;
        Mon, 23 Feb 2026 02:50:18 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00c18sm18076613f8f.14.2026.02.23.02.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 02:50:18 -0800 (PST)
Date: Mon, 23 Feb 2026 12:50:16 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/6] clk: qcom: Add support for Global clock
 controller on Eliza
Message-ID: <x5tb3e5dymi4akickj3ie4n5wnhwaruu3bby2f6wwjg6a5lav6@r7d3mpdjw5je>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
 <0f3fec98-4d58-4197-82e4-41480066d42b@oss.qualcomm.com>
 <cqx6t5tcshcqyof4aaeawa7gyocaokzyqjmyxgxis7xsfc4wwg@jeggol3ifwu7>
 <f3394308-ee08-45db-a0fb-569d1cdd7fca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3394308-ee08-45db-a0fb-569d1cdd7fca@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5MyBTYWx0ZWRfX3OPhiCxaO+3F
 mO/llhgX8nSdlrhpJ72OJapRsw8jcjfrkgLBYGn6pCn/9xX+iuFT1WsOCDYcYSggJ0XmiPRO/Bt
 KfZ4W+fJ6p3K4pNvv1M9VxNiwatpNZHBsh8BeJoqhoYpumdcYkjhheZiWVOd6itSRApEQ1VBTss
 fqX9YPduq5UEQVJScMtJ0O9/EdMtNMlN2suDW5gcZJ9BVDoA5LBVp28EizqxbZdinhTVWlDI8XI
 YgeyaGRyqlljKY3gpGUlG0IHBUGugZkKDeIAq3bPLNHmIh7T68mioat7cvtX56YZqDPzTihIICx
 3C13E7dM7cRM5n/Bhu+3ym5HyiYyBS2w4T1zBCUv1WzlGW04bEsU1+VR0X/AIxanSgdvP98ZMw3
 brfLNPi7D7tK1dYleNeFyqMiuVOGb1HI+PQoIscxclUlfHI/IY31rdjGl9iJ7/2MEMpie9Hwqmn
 NtUbi695+1hENjavgVA==
X-Proofpoint-GUID: RRY_pZMYV-qCOIRQ5SzjU4kvbsZzWJes
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699c30ec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Wdn_pmPIT5SXTtawzMcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: RRY_pZMYV-qCOIRQ5SzjU4kvbsZzWJes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230093

On 26-02-17 10:26:26, Konrad Dybcio wrote:
> On 2/17/26 8:57 AM, Abel Vesa wrote:
> > On 26-02-16 16:57:24, Konrad Dybcio wrote:
> >> On 2/16/26 2:43 PM, Abel Vesa wrote:
> >>> From: Taniya Das <taniya.das@oss.qualcomm.com>
> >>>
> >>> Add support for Global clock controller for Eliza Qualcomm SoC.
> >>>
> >>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>
> >> Do we need force_mem_on on UFS clocks?
> > 
> > Not sure yet as UFS isn't up.
> 
> FWIW downstream does that for this platform and it seems to be the
> case on most recent platforms too

Yep, UFS is up now and will be part of the base DT.

It seems we only need to force_mem_on GCC_UFS_PHY_ICE_CORE_CLK. 

Will add in v5.
