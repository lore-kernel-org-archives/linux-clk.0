Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB41A388E61
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 05:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241372; cv=none; b=pED4Od9P/MVJZbcKgou53bz+GWS+L1lOw9gjRlnk9VAxJ/Q/GOw8yhQda3ps0m3XkwgLFz0xsnQfgC1ykhAhsQWDqkNn62XaD6pdfUin07OQMdzIzTahLwRBpPlRB7oXhrAFOruLR614MgR4zLcIzuOMyUHNNtwopF/q9TsztIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241372; c=relaxed/simple;
	bh=UIKstqurvDjxzL0QWKccHfdzWCjnXAwcsfxWJHVXiSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tepQz4hiK9Q8cMRyqFX1rPTMMc/KfwvPeJZscrGBvbRKRrm2SPLOL641SeKCZ+mGCNrTxgkAaVuUlhAdWQkFvucduln5vJ3sl9PVwReVdIc0f2gFcfw01j28dKrHz/IdhxHvkLOEOy118yShcfV0W2xyUMHNEpbUUm7lZbg97Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ul/wv478; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lj3F3Mw4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ul/wv478";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lj3F3Mw4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6811q3n9585563
	for <linux-clk@vger.kernel.org>; Tue, 1 Sep 2026 05:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	npe/2peK2C9bBDAaOxR3J7lkyOAeQjeQi1QITJ386BM=; b=Ul/wv478uHinSezB
	caeZKYe44/KP1hBaIuULUvqNEGuJAn403Xcu0ydSPZYkhNIG1qgD+g7BrmZ7C67i
	wlSGDQP0fc7DQX2HISnzZyO/psDGs77O1gADnulW1KFFbOpBCCfSGfInHR3N9vfk
	37Ne+OHEwH9cBT1+s9VCnHIPsjhobrFKbxh4lp7XfUxY4HGiWMi1MCLMi6Qow/kk
	Q1eyiA/dHSL2QBMDStbZ88VQUL7jg8Kg0OogQD00KhlHu1oqEMWEurya7H4FVQrT
	EfUPPFOeRfTmGc68ev1rnYrYPLWqOkWZbQncg+9qnnZ0WYtsSlRDXh+BxSBzNK7N
	rAQoyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx8s4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 05:42:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so834794a91.1
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 22:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788241368; x=1788846168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=npe/2peK2C9bBDAaOxR3J7lkyOAeQjeQi1QITJ386BM=;
        b=Lj3F3Mw4AXKPXSB3PBut5Dovl2VwauBy3rA90/LGub27Btt2769r0xxEakKX3bR7vd
         UI6mCdZq0gohhFGpvEoRdXZaXP/2P6C6R24kD+Zoft9X5sRO+27rMea5g6dzZxh9EJzT
         K2ZeNEZrGc3+ohly/1CxBOPR4zWSsFMj+vtsC3ja8w0Z7ouEvO+e46cC8aQbHIaGFoD5
         6A95yMDtI2RJ6NDSXhHsDWC7IhvHxsXBnWWobz8XT3IukZbrNZCo/f2EI2bBbbjF++KD
         wrHUTruppFzAmJBZ0tVeznB+bLQxe25yJDA/6C1f2NghM8owUlwpWCeSl86U5aQ0OPLY
         eAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788241368; x=1788846168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npe/2peK2C9bBDAaOxR3J7lkyOAeQjeQi1QITJ386BM=;
        b=kyLdh9BHYiMWiJCeNqilcW2vsZWmBaksvQzJwfvvkODKw29oSj0Aii6WPy0VvHcMYs
         cUtdfFoMNHvBr4N2eWIjk3yNQRW9Bb+snbqHS5wRiXxsV41vMA48Mw52ycnJglInkZzq
         jVASWBZ9cvBLaFUCCRCDsEV/0VhbP2uk1JA2JFhgc/ZCAJxbRxTIdn29rm5RtAJ276Ug
         kvEx3fy6I9XdNi/vZSdptwdPgM+/FmKfqC2ekbocaYl6rnqZubVsKEBb7HijEDlRGw8z
         DKJb/nu+Lxhd13vYPVBoSI6Bowq0b2GU78n5eYJ4H6xdU8DIbMsm+Eu7cx8ouV+t2puA
         Gwew==
X-Forwarded-Encrypted: i=1; AKwUvBwSDgmnYNUMifSgalnam9LeFJ/Ljxey0ZhpbPNhO3gF1THTk9cfIojmH3quv2lsETJSTVerj6poN5E=@vger.kernel.org
X-Gm-Message-State: AFuF++myuESkyM5zrVFtDHkHWwdcpFnHUiuzJFPeVj87Ojoh7yl9Ppk8
	wm8/5Yjkz32V6HRg3ihmoUPaD/XENjOwLP1NlbxM05gwPheTNALdUTnbZnMuNbImzYFNVeIT3Md
	9m8CNrDTXhCG8g7XVnLILVwLZRDOPHi/r9k1FakguMtC8B4JEs2fzL7YH2kxCqvc=
X-Gm-Gg: AYBFou2mWBSd1VFc7YZobGmJW9e0eTplWm94kzX3jMGzr7ahuJr+Xe5A93dMMCANLai
	W7Mq+yFp4knAiNaaFMlNvVQUcY/brwz2SfyTnYolrGR2+0XlqERiVknd2qgn8t2XCq3JHUJ3zxX
	vN5Fr1elTl9a/6VwFmacksLYpKvInbY75BOuyeSex0eU3Z2K9FeX/+O/raZ0KZ7EdyYTQ5taXwv
	+VEG+ngttgTTftlBICiEPEdHak77GPdErtRGH9rKFvt2Rlq2BSl0CD3IMAAzvkbNT/Vu4HPmWMn
	2wc60a0xW3+dXod/0iXJGWi0CnHHHoWge58W0t6dGas5AnWsn1juspR9lncjAOCfmJwsloxTXm+
	dwg5vAPA5ZSxF/QzYC6hDkvmiAGxi
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr34855718a91.17.1788241368212;
        Mon, 31 Aug 2026 22:42:48 -0700 (PDT)
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr34855637a91.17.1788241367755;
        Mon, 31 Aug 2026 22:42:47 -0700 (PDT)
Received: from [10.217.217.192] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm52133553c88.4.2026.08.31.22.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 22:42:47 -0700 (PDT)
Message-ID: <8a4bc155-9578-4f9d-9258-022ca765a2ea@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:12:41 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: nord-negcc: Add the
 secondary QUSB2 PHY reset
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
 <20260901035322.654-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260901035322.654-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Zlt3ImnmOnCWWbKuKp467nSXefuSQdxs
X-Proofpoint-ORIG-GUID: Zlt3ImnmOnCWWbKuKp467nSXefuSQdxs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA0OCBTYWx0ZWRfX4eYXHH6zZMjj
 MXnJNTHOq262hhtUgtvyGP4Aavh/q4sP47/6Mgv2vspy4lJBnOkAFLmKSqcHTWJI6Sm20mItdCh
 kiovFXDXZIfKntfcXMCDby230cCyKxQ=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a9665d9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sx9h2hvFvrCHTrld4NkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA0OCBTYWx0ZWRfX1/mRBEi9PL3h
 F2Ef8pONdzZ0RBjBxCW3krMDnLDgoYo6gB+4fTHd5KF4QThrGf9WRAfkNJoDpuoQ1WZ2KOMq9L/
 SU2fvQMehdoqB5W/NSqjsaN0+x4Rr2kdN2Fpt121K1gicwvZcWpAPfAYo3xtjnXwHypWlGhaDC5
 NFMN6VyvVQK6yATWWXXTiCy+RqgJ7Ublv67XIZV8FxgKPMPWyn5KdXCvS5mbmX6BSLGyMUh86Ko
 68ORFtcuN6m7e4vlnT8xCM4zXwnXCabJ6G28mD4OYVO3h0Fcsn37x6AwJ3ZBkL21wnBIY+NdtwN
 ANLgeKIWdKVHIxxcTWAsTnQAfMTrBmY+5IzSdhKWhQBxMU7W7C34yj6G2JT+kxvkfhIVNS0GEW8
 SuJ2rXAQ48yVi/7CLfoGXGgbaaBSsEd+Yqo+KWe6SDD3a8nSCE+npHkEZ3QO8FGm3UrmC1J70pX
 iuxYKt0RqmHPlVIW+5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010048



On 9/1/2026 9:23 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> The NE_GCC block has two eUSB2 PHY block resets - PRIM and SEC - but
> right now only the primary is registered. Add the secondary, which is
> required by the usb_1 eUSB2 PHY.
> 
> Note that the SoC has three eUSB2 PHYs but only these two QUSB2PHY
> resets: the HS-only USB20 tile has no dedicated QUSB2PHY reset and
> is instead reset as a whole via NE_GCC_USB20_PRIM_BCR.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

