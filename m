Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEA93596F6
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950935; cv=none; b=LTGw4IpeqeAm6v5QLZYpc4cBI1TRYX5yoWoY6WWKrOiwylS98i1clCMHw/E/77GAf+62SXnfFc/8gJyBpSy/9t3DSQmpF9h71ITAHt9FKWmt6+UzqAY0DLLe9+paMa3M35TxYttVjey/fJ3dfWlytQN3UknTiBwIIX7xC2sPtnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950935; c=relaxed/simple;
	bh=kYTCB/L4YHbdTOD7hf9mh07CsbNXHbc7XowcRdLeJgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFHqmE0l1rFFOPf0gcLDdh6MXiaV4imiR64FJU5QjenJ8yh24THiIqvxrdRIdyfJbCwmcy8keuyO5CD0U7Yavm5HC99vkgzgrE0nca3EeXEGfLjQ4syK/aMSNps4ZMjyjzgKDgZ1YutoZ79bTiNamQZkk2TKUHER5Xny4zdyq7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TsNzaqk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuXIcF/T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TsNzaqk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UuXIcF/T"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099NYX63324857
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 09:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GEfRPuJfPIO4a4YKDu7GRpCX
	Q6wrN9cZ+pQjZslwhBA=; b=TsNzaqk2Pb3MDKyQI7m85mOUSpRzPXxCWKwdkgg2
	18fc+MOF3jfKfzrPhWQSPHp+tED9oZ6tJR/RBUrGgOocXyVCkNT5UMV80BgHs/mr
	3+IS82Gpq6fw+n8DbPP8WwrYK4OrVMtguLfpmUN+N/2NmB5eCnrXHhKKzbO1OqUC
	AjOU0NnyJrCcaZVEAdcwf+B2kRKDJUIxx56FTvJpyJXMtGdcUDQWqxubUqSpvPeg
	wqaS7gfM9HQhfh0V7YTgADwcDqLb5eB6Jez93Q8s1z6FIW8o039AZWoxhFU+uu1K
	bTvanVJf5eWGzK7MfJyZYngIGbwE5veBvpciOqEAJVtLOQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjrd6h89m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 09:28:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b6a9c80038so444041785a.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 01:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950929; x=1768555729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GEfRPuJfPIO4a4YKDu7GRpCXQ6wrN9cZ+pQjZslwhBA=;
        b=UuXIcF/T5z4YLUELT7kYeg+y/xAbgl6pOh9Toz12fF3KuE5ucEqdCrx/C85tI+0gji
         4q1Atyh2RLGoyuhu6wVHuU+Q5ob6iTjJo6SSGPFHjMZMC40HocT6tIEEmfCFkRVur3MD
         QiZsFJSeHQX5AXsBuEgvHvPjvgDGTlvoSogXgUw0W4+Bt9SdbWWaoi2Zsi3mtDi5B7jN
         4oJd/3vxzHqGPHA6W6igMz3EPoTYSAI/dKA83iHc+ODkua1eyi/YUxz0XjJuQdMAkddf
         bCBp3KuFK3TXSJN4f5yl0HOFqjbUbgqCVebE4yZ4jdWCy9toxseEhEyPbQsQ+BQZmE8X
         6b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950929; x=1768555729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEfRPuJfPIO4a4YKDu7GRpCXQ6wrN9cZ+pQjZslwhBA=;
        b=LGnk+532InD151JPrEtlRiHdYZ4/WrAiN+djIuay3svhDv1GHbegcq2sxbWCFlKAtl
         1xZ7apVvkhCaZeAMfEQerUbNCXG6vuO2LjvvxBerCSL1xqCx4WSwlqqPkx9bh+vgDuSd
         zpZcbQ2H3DxcsvEr3iE9b9GOkxa4/EqLTQkWUfXKHysJMfm7Lnxnma3DFawIlZAj7Vub
         16OujFPjvZHq3GwSSansS4hb2L6Vuz0w1N4gCqYAgcjCK7/OoHMu7/aFqw5rk57cQ5CC
         riq7Xd5wr+329a9h7bBtNZLIYTlI0hgG7uRDFKAx+1JWfI7iPKjEs2GJaLfvXdUHjkmA
         OHTg==
X-Forwarded-Encrypted: i=1; AJvYcCU4VB2nK4jGd8qdHEyUa5xidUZyRGKStjMta730pZaMiuVUZieWEFnlEPnPeQ5cAg0+pqEyOM0B5/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzavi/u4MhT+P4o8I1H6ufdbidzrzqkocLx6Rugfs4VJTrSEYVk
	n9UJ8DWpk8zYji/6IwBrvcStHhOQD9pcZeb4PuKmmI7qyWxlk+qAASDzuYDAJjCYhvKSJZDiuos
	uuKi5z8hfVm3VrUhObIHC2iCRCCQybc4XG1aVFawjMl3Rcx/mfMjXJyd9uexYUIk=
X-Gm-Gg: AY/fxX5jvrzx/aE3632gYdY3z+oHbtxRAvtXx3dkfXGKl+15e/3eBeAtXCB2gqaebob
	ZYSosldrIPKgXKt3RMo26CBK5Fn1qUhFtGFv8IESEK+/Gqd9qOc8+h4xvI7QRBe6wJOqFyuW0S0
	fPuvmjcYt2nOWJYzV0TtdV26Rqa5BymRqL78EZUnzIoCMXTK3XW9ikmxkPxKqFNsGD4qeV1MLvb
	uQkBfrxvbyg8d7g0M4BB+XWimrPj6uyhgk8z86sg0UAcXD98FAA/JIGfmI4ff14ZPpwmOTtDjeY
	EnXYjavnWisDvrA2T7KidSumV3oIaUqyg13nRIhK82DrCDmIWeZpheiscPbjfbfZWDpw5FDmCuO
	cT1qQzUE41p6UB39hAvk2
X-Received: by 2002:a05:620a:690d:b0:8b3:83b:6e9c with SMTP id af79cd13be357-8c38940e5efmr1159352985a.90.1767950928718;
        Fri, 09 Jan 2026 01:28:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESKlavIIxl1Ha0Row7R8T2rvX7Maaz2fxMRuyWkE5PfPRsLbtuY5ok0WgCgBw0ThYZy84nrw==
X-Received: by 2002:a05:620a:690d:b0:8b3:83b:6e9c with SMTP id af79cd13be357-8c38940e5efmr1159350985a.90.1767950928089;
        Fri, 09 Jan 2026 01:28:48 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfd97sm1019058766b.36.2026.01.09.01.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:28:47 -0800 (PST)
Date: Fri, 9 Jan 2026 11:28:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 15/27] clk: qcom: regmap-divider: convert from
 divider_ro_round_rate() to divider_ro_determine_rate()
Message-ID: <srhglmad5fjowp2fmxvtoz4gw4knh55emflyhfoqyyhbq23ati@fejm7dya7cni>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-15-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-15-535a3ed73bf3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX8zCuvGULStKm
 iW+nZ+3LRySP4JRIdkxFjlvv0a70u1HOBicLVToSZL+H0zMb1lXthJegLm8hfMJ3X/zB/ArUF7o
 jLRctnKM450g8XVhgiCIOotaD8dfAJEm2sFpgpZuBYmLaKOLf3OIa42JdCvXSs9zjGNo1VklXYc
 49Pl0Sow5t2tpYLusNKzwH0u21cmP2XYLcDRt+yQxre1UFfYURsy93jhwhphRg2ul4FsOhYtsLZ
 Pa5JjOuhtykg4n5vWIEq5NXprqdD3T7BUW7bGvoYVb1QbC78fTbhpu3X6jgbYAov01IXaP3tJFU
 KvYhBXOLZn10wbcYbV7VeCdZkdavhTh/nf21pCUGI5a5+j/jSxK18RQFMMvz1FE8/R20qx01kp/
 aJR20noP6fFuFpq8pbrjWk8JLzGWRJuTBDCG1xMJ7Yb4gMEldb8otSlyP2QJZeohqkl4xizxNH8
 haNd5PDwv6udx6Q2W2Q==
X-Proofpoint-GUID: 2wgeTY-Hi9Udtdl2PqGdutCDY9rBJ7qV
X-Proofpoint-ORIG-GUID: 2wgeTY-Hi9Udtdl2PqGdutCDY9rBJ7qV
X-Authority-Analysis: v=2.4 cv=Xtf3+FF9 c=1 sm=1 tr=0 ts=6960ca52 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=bI0rxR5HNnv1m9k-B9oA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090065

On 26-01-08 16:16:33, Brian Masney wrote:
> The divider_ro_round_rate() function is now deprecated, so let's migrate
> to divider_ro_determine_rate() instead so that this deprecated API can
> be removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: 859a7e020b23 ("clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
