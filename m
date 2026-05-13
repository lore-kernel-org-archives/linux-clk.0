Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE922DC350
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 05:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651645; cv=none; b=UF1w+qW5NLPmqLIqKJsnAwZ4Ra4kr7xDIdn5BNxCC/sKjPQbm729An4i0iks8VwJxYW2d3g2lcF2JZe/wO8P1pfWjqkaHezO9wxN7uqBQWonqMOaW0qV0uw2zQW4RRGlfl+ejm67ud1oDe9SIyHf84YztT4Ei2tKdMopBZj8ElE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651645; c=relaxed/simple;
	bh=UnJvUJpRNNfyzbju9hIRD4XCLD21HfjRzO2le0X23OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ap0W1XmI8dV/4d2seZ+ZytBrsTGs5k19PiWQ3TFMLm6mkFem9ja2fprI6Aa3mayjl2tXJfIed+nJCtWefJh1tujXh6NDeI0x53vjNSnsB3hm79hMLTvMMEGu9/9wcFSXGjpzzMvVpqQdLdSpJdsuaUs0jw1CFl9VAg/NUXo3SAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ct5mndGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYlhFcA9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ct5mndGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYlhFcA9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pW8I3136880
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 05:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=igakZ+T9PFkC2Q5DCnBIRQV1
	/3qc7a5qRdWNS78TK/Y=; b=ct5mndGR5KLs3Y9OTa0/7E2LHpnDoK02ZbcREVYN
	P0Zs7zZ5AuAuh3fhGN0M2qNWm3qdQjKDZAvJYYv2wNrBBZndhkkI2UJ9gbHmRRfS
	i7C7uucqzfsziVpXHlyr5TVbaS+iXseo8wPCWLzRSLK0njI46vF4ayS+ZoNKlKUK
	gFVp22/ECt0DjUJdMtHCJBWT9d0DWWiKFyrLaUOoogXcLghrdodIX9Ju0ARs6L23
	qLW0oDf19el2UOyOaygz2PqiKg+60QUnAqocRIuBFE7j30+qJXCmKLhKV5SB2jeQ
	GRyLQxxwkg4yCRHBCW0tBplxlFGniO+6xJRlTgCxFO2ZpQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhuybc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 05:54:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5162ee45a77so10141241cf.1
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 22:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778651641; x=1779256441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=igakZ+T9PFkC2Q5DCnBIRQV1/3qc7a5qRdWNS78TK/Y=;
        b=LYlhFcA97dD7YJ8LP2X4t30/qwZi93/KsHGwk4HJzuAPqxXUCd/O15+MUKwCXB6283
         7O7vBpYnEs8ieCzxMTx1un4CjjEHMotVAoQLIZbWNP6Os4osQzysh7SJFKl3BlhE+yH6
         9tw5ZM4Dx8ZzaOJQqWGe7FuUdCrghvbJkG8GHdtq+ccU/pBza1w1tfltEJZ9EmRLuipg
         /QR8ndaCnWe6LwsM3sTiLYJr/YeyMThL8hwsCoX/wr2+5Sn0S8tuFLXvLd44g49XcB/e
         e95qeQ2TG/Aq8zoKGNrovgegV2j2n8A6m8IId5RUYlJ0fWREUyvLYp15Nn7GIG+vUdVx
         N0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651641; x=1779256441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igakZ+T9PFkC2Q5DCnBIRQV1/3qc7a5qRdWNS78TK/Y=;
        b=IpQ43hz6TATqze3o54S40tkhSTJ5abvqHMWH5XdksgFWR6aaIAyFDiJ+V24Ny/jv0z
         cuK9Iy1/TvBN54LPCqjFR77I6rPqLxkx41GZi0UCF8piK9K5rxxKB+xwFlG2aZH6Qrm3
         pXPoiKCRxREOR/JcoMQRyT5jzIqWEAec3cdFABgNUFzPzEAZcfV99zgWjX0xJC4Sd6lh
         2DU/7peJNsXVS/zroTECaG04Ijo68ZQ4KLQIkj+wbmZz8fkCnckulVCDiD1rlAOpPhg6
         fReKNHKLBLqgUpnnTnods/ZcfmG3yuXlLO2DXMEfuvyUYO4kIJEteXFGlwPc4dbwX/65
         SI2A==
X-Forwarded-Encrypted: i=1; AFNElJ9eTuULgyIk/QEQWKcLLiVxBiNRFAhojho4vdZmkf4RyKTbwVZxRbsGtac8wR9Tm5Pvw3Iv6wjpY9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVB+q/DXMWrCAuhXNPFndMPl64bePLUcr32PexpXPCaOAZgkyy
	62yRNx+YPQtv7yCr3DbgyPtrHTdcEhMiOwD4/ffzS6g6J+hPQwzlX0//wX1ycGRwt480cbQqSKZ
	NNBKWCDj5au9ycpAGklEfLVyNUWMqdlOPPNdrHDFbF3siDAd/uxQVbgZ9mL/JTw0=
X-Gm-Gg: Acq92OE8LkY/YIiSNh8YsqdyfnugbF9xiwiNQo/91YmBtTl5fzSWhOfH1n+phM8cXEL
	FFEhl4BycRd4MGWXhrgQq9j1r0LV954TqKOjlEadd/hofe0TGgxf3ymw18rLZmcAGrx9nEFZUjm
	mxQp4k/JEiw45qlE+kPOtVeKcB4TlPzZZjcoKRTqdedN/W8aewT36uN2x4xBK96Rb7d7sRjx2IJ
	WAesdwjKeeuNi3hiD2cBIecwN6OWJwHz4DiR+sV/T2WNZ4iQIe2KGv52Wz3uzQNaeUVbnmx6nW2
	zJSL8fJm77Dv6+OfdtccjIZDz9aahb40ye5JjzXsTPGmFgFIMRhBAyrhbYDEyGDf51ieMZdkB0M
	RzWWCwhVbm0Z6X6ov959sGe+3KsTdDOBayAmB
X-Received: by 2002:a05:622a:295:b0:50e:6313:6e12 with SMTP id d75a77b69052e-5162f4c2bc9mr24529101cf.16.1778651640927;
        Tue, 12 May 2026 22:54:00 -0700 (PDT)
X-Received: by 2002:a05:622a:295:b0:50e:6313:6e12 with SMTP id d75a77b69052e-5162f4c2bc9mr24528751cf.16.1778651640373;
        Tue, 12 May 2026 22:54:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548eb75c29sm36600978f8f.9.2026.05.12.22.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:53:58 -0700 (PDT)
Date: Wed, 13 May 2026 08:53:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
Subject: Re: [RFT PATCH] clk: qcom: dispcc-x1e80100: Fix (possibly) dumping
 regmap
Message-ID: <esihuhpvp64c5washjymefi7p5272xh5qlme4myja4mduu4drl@i5zzpps45s4h>
References: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1NyBTYWx0ZWRfXxFRwhVP86bzx
 6AD+RybQNvWBvcwfUNcQxJTxFhF6OJnn6rPDdekJkEQHQOKSKe5Y5nfRzmffYIaHynxzeFbahek
 TWx6edlB3oLwbQOTPvr7XaBE0Jfi7qNlMXfMKFN69Zt3JSpCOdZjbd9E7te23XpN+YKIWFd0ck0
 8c4OniXRjm5rrXI9BuDjbgt7veWtQRxVaSl3zo8/hNlYSX70O+4molNLoFrG3wNYjEmo0pEVd7g
 ZZ5lc4bHsmqA00x/4L0PG9tjuIuQiekLLowGJuw0QwQBQTTg+lLbm4QDhc7IpAybkUiubYta7S9
 Z7AeydWWqPQG/UE2vt6kVSKYfFPYXlZ5FAcdeIA/vqEtYj+en21oK/ebGyCRmpN0acfCV3Vyxj9
 1XMxxHdD9NHZ+y8B5c4c9HfTpzjn5CbI476o/mAfJi0Rxc1EBgygdfkDT6jUbFp82IySmGcruej
 Ove1ttkJW35JopqajAA==
X-Proofpoint-GUID: tThOAzkNhb06yllW-IhT860Qwopk-fsl
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a0411f9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8
 a=ytYsqP6yL_s07xMKdPkA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: tThOAzkNhb06yllW-IhT860Qwopk-fsl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130057

On 26-05-05 17:29:09, Krzysztof Kozlowski wrote:
> Reading few registers at the end of the block (e.g. 0x10000, 0x10004)
> might result in synchronous external abort, so limit the regmap to the
> last readable register which allows dumping the regs for debugging.
> 
> Reported-by: Daniel J Blueman <daniel@quora.org>
> Closes: https://lore.kernel.org/r/CAMVG2su+V5fcZ9LOC0Qm3bpfnhpbmQdJackc7-RvfztDL_dajw@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
