Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FEF492E48
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992211; cv=none; b=P+/UGyHHam1DveyfhPW81TrkwF5PtSjXqDfnI+K9f4qIixkNuqeYf02NJEe5D5oih6g59+hp9a679ud8IkYqm6Hjiw/AeIFg2DoWyPdlANkKgFqfud9Si6Kvf5Zuzm+R58Aws3jc/fYv6ZANbuD9emMuFqkkgPE54JqkkYAn4dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992211; c=relaxed/simple;
	bh=scRw+GVm6s7wVCc9nPzG2SgvvrPpNiJqmfTKziigzDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reHbCPVe8ZFVBSJQWA1Y4/DPOgqQ5S1T7dcQ7N+cFZ70fX4urB2qKannYU7ziJ3MNVJ2ZwlWG2XFaG6Co6w8ZaGhX993yPlAOUysZ8fq04f6mbcuxWf6x55A5JUTfHeuE7Hg/+8t7wyFVv0et5/cTcIGBrrkcUqnqbvfEz2mCuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGkLbO9g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKFxn0dZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGkLbO9g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GKFxn0dZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdn0N1217321
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 12:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LuUiIezO2nuT5fNMnrZdAnpP
	J1LY+LflVe+Qi9hbePE=; b=OGkLbO9gyndnffTpRHHgHLpbV5cjhfg+nKcTfTa+
	iQ5TftiIuo05x8opyACoMOENJxGBZ/3Xk88+FzDvmm5oK8oui4RXMS6xxGDx37Dz
	sUSufxNELrGaLW9WSwkuS9TDsT390CgC+l5qp0uE8z1BOamsnqPO7HL6VvJhmKIo
	OKmCidjWsNcIB7NGKksHTC85XUCAn3f585XpVoMgBmJGCMt522w4dhqqOtcLE4+w
	Eu9fK6MhdJKLYdc+9NAlZE5ePTgcob+OyfP8eT0FITrgXsXfSIz/vTpzCGGHGJgU
	4ycX/kPYsDs4H6MltVlwYzqEPf5VzlSgKklrRqRI/QgRSg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01194mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 12:03:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-788e076423aso691743137.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 05:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992206; x=1790597006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LuUiIezO2nuT5fNMnrZdAnpPJ1LY+LflVe+Qi9hbePE=;
        b=GKFxn0dZNTejF/A1JgrOKgXwo7ZStSE09ahu/Ml4Dc4Vn5gZh5E1izNBZNd4VyrG1z
         B9ocngMyfBqkONzW9At+ZbW1h6/aAZs5o7ZSp1hp93BL00DdBESCs1oLCkDAbZ9hZAMK
         pQKs83UJNFSPeoVIcW+IDg6T4ivYXw55EjwpcWarLj0V3lXTcPMmW02/WbuhzqbVP4aq
         +DFoF/uzpoyCCwlTSHnWkDi2RExJ0XSxNRBj0t5L5l67MS3ZaNVEbEsG4/WsLNEIC+jM
         43Ub+qim96jiy02QApVEy+mJqg+YTZj88DYNyKf+4hl9SB995r0xejyxAAfsjKBa+6n2
         aXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992206; x=1790597006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuUiIezO2nuT5fNMnrZdAnpPJ1LY+LflVe+Qi9hbePE=;
        b=tts0P5P7zl0TUpuOT3pR1qCE2XsAoS9LG9T1cOMTdh6Y3xgcW9vDQdyOG+1orG4rUJ
         KvZWDdhyvBNA3yJM6BDvLTiBQYtY6iLfOl/pHBCIfyo7uFMVRauB6JpNXl/v3JIXkQBE
         fMVb6k0HXGXtSbz0FJKUsgyxK5gguGXAfmCFOnC1qgzyQAvjgVhiQaTJlbpyTFi+P/+A
         1WkNupAY8c2/ApPPZv27eLsMw1sTVA4IRQikCHRY3aTPepIUwMjvYn332DiMO5Jvnr0B
         4YxoVen9pIs4xCu+60wcux0HOVxZimIUH67HjBvPwohsLvjgrwcotPqMOZWw7IQA4n0r
         2vpg==
X-Forwarded-Encrypted: i=1; AKwUvBwB3XljN1JlClAQhVANUueUEJdfdG8YLK27UBuqU/64hVitH46CrxnJeax6a671qTgesREcNDX8ZPc=@vger.kernel.org
X-Gm-Message-State: AFuF++lNbB7CBwKKOKoE0lkXgwvp4fN1s9xr4lf+MCBA6eGC9qPvIfz5
	lBPiVCCra2PGttwZg0yeFC8fqKXJ1yRQMR/gjGRQEktjhX7vqYCiWEZiqb4FCY9kGo09i7yXpKO
	TxTWSIpJEV8aIETkex8mPacCBPGGIVKjCt/yPJ28aMxDFxoAfdQGj6eb5JuoCwl0=
X-Gm-Gg: AYBFou2wfZdwnMVnKGEU8GC/P8505HZZWfX6rynPxTGAE4GcxZHYB+XsLb33vwGNEEw
	+OxqRV/6KZJ8S31uXTrPMi+vXA5/UJ2847lfs28N088F8XjtxSi+Yw76I7ie821Ri9RLnRcLU4s
	clvpK8CuJ7e7RLZH34zz6RcLn1vPo8BWwfA4WmUTTV/ISYR9HOfQ1Pc+ZZDfHcz/zM74VVKYOGs
	9qJPoky4Zul+Q/0XCMdZQdWVYtgt65WmiAE0Bixq7QjUL+qGEwEjckSFP5qk64rA2Jt8+tEK5NN
	n8F1QAfzmrb2EWkq60SoWT6trtQLUxpKin3/bPJ3HB/4kd1j9dBJMLGRMz/oyTJ7P/23hofQGp2
	BByjVUyPax1T2mQ==
X-Received: by 2002:a05:6102:3e87:b0:7a7:bbf2:182e with SMTP id ada2fe7eead31-7a7bbf21e16mr1506155137.9.1789992206057;
        Mon, 21 Sep 2026 05:03:26 -0700 (PDT)
X-Received: by 2002:a05:6102:3e87:b0:7a7:bbf2:182e with SMTP id ada2fe7eead31-7a7bbf21e16mr1506089137.9.1789992205486;
        Mon, 21 Sep 2026 05:03:25 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0735c9sm222876985e9.6.2026.09.21.05.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:03:24 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:03:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 02/11] clk: qcom: ipq5332: add 24MHz rate for USB UTMI
 clock
Message-ID: <mfzlmrhupyqxj3pj2h7rhqigek2gptimcpcvtn2sk7zfzhj34a@od22z2qpdynv>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-2-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-2-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-GUID: KAY0EVCqFfeadrGSN7YQfI9E7VW_rKB1
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab11d0e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JaUoqYncsU2g2DIqJJIA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX8hrpZjTX8bMo
 38h+6ZuqImLwlMjxUtFUQ46vG2QnpQcSG4bjLbqQpqzgaajFCjgvC8u8/thvxWtSvhR+OOsoMvb
 d6B0G6KlysQ//bRfPmgp5fsgrQ3iAxtTQogfiEZw/b1mhWgNm+cjaxLzyFHv39pTG0lfHMlwbZY
 AySk4IkqB6YY/q2gpDSkRzJLPEjwpI1FgnCJ3sW9k7Ahnn+0B+6mUBjan0MJ0CSikgOkFzp6yP/
 q0Lzogb+MDc95736fxr6LRKesKby4R0UbT6OUKs9InZEa2IC2kZDm7zq9FG6FZ1Gwp6lYaFpHoV
 d4Vy8SAdoLsMBD/YrYu5v4SZZ1QV4S3QtxLKqgbsuzX/543q1GeSgH/yblGPHDZuJgkBkj8t79N
 8NyYhW6jInsnQ6CC7jpG4ijDHyo+E1zsS/c919+Oa3gqH+Ljnt7FOd1jw2065I/iINLVcQ4NF9S
 AcZEas+zPDoFSY2STlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX7Tq7a4xIgHOh
 THfqYRGXcma94QB40gUu66CfX0q37c+7/a5LbkrefwfgO1iY0sGGFzPXWyu2+4kxxQa02WqKujU
 wj/QG+9JuzzxoxxIRPUkyWQc45sVN5Q=
X-Proofpoint-ORIG-GUID: KAY0EVCqFfeadrGSN7YQfI9E7VW_rKB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210174

On 26-09-21 11:49:35, Kathiravan Thirumoorthy wrote:
> The USB UTMI reference clock must operate at 24 MHz, as recommended
> by the hardware team, for reliable USB operation.
> 
> Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
> fails when the UTMI reference clock is not configured to the required
> 24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
> the enumeration failure and ensure successful device detection.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3d89d52970fd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5332 SoC")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
