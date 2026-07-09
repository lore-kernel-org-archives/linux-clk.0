Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63F3410D08
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 11:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596260; cv=none; b=HvARwxEabpB3Zas6jYGabG6RDVK+1m3R94v7JGSYkHzRSiU1Bb38GpVDQfPfS6tr/V6Nx1tnx50YxL1CI46lmpsAd5oq0TfvxzKco1UJGD+Sm1mWpbKwu3tp/oWkkH/MfKbmT/nW+E/tJEtT6RkRGqQYscbfmrwb65bqS3Grv8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596260; c=relaxed/simple;
	bh=CN5h3TyOwEIznSft0b8xErmSRMFj5sNT+X4d3LzCde4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8k9x6eMPWHZSWIEhLNAUiL/67HVOTAPLIrk4yiF/2uM5lIsJxvwtihgbH3YAWjBfEf9DruTZerkVbWMMlfwm2UIne6qOPJlzsh2/sFzf/QMPdlW3vAmnEozkNh1J272khPmiiqFpoGUcZUTA74IZ+pplLh/15068Lr+4hAbVog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=je4FqlXd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxVqN75Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="je4FqlXd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxVqN75Q"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN7Hn1537221
	for <linux-clk@vger.kernel.org>; Thu, 9 Jul 2026 11:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TwEVV0cJXSPJJj4UNs7yhLlyqJbVus2sdd9Q6EnUG1c=; b=je4FqlXdnHKAyBSa
	rdZB8gfHe70pTHbPgRgOG9sP8j3x5sts4MwxSNQT7bXIsIM1uGpk3GgjAcVY7c6l
	3vH1ty293v5pcSZyvTNChSWhVeppFflSyFp7/Q/kqCrdABwf35CmVcCIZGRxIF5j
	gCNvYeF71p14zRkKw2kmo7VbxxyR7L1xrilY1OQJmR0RbMBM2JY+JXhw0uUfQayX
	sdmEJgBOnUc99YaSFcxwqEPfyy1LUG9YKsq5FGeHTBSkoVxKwbvCKdq0+EYySPIk
	srGLRZnvyvlPmqntq2/2ehf0M4qDbZcWoRislMk9rseudcHUtj2h2lH/Bn6YFQCa
	F2zmGw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtbpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 11:24:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c069f73e4so4418081cf.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 04:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783596256; x=1784201056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TwEVV0cJXSPJJj4UNs7yhLlyqJbVus2sdd9Q6EnUG1c=;
        b=NxVqN75QFzInA6sCLgA+zEndUK9tiJ8dXVmB6y/ospDk8RSfmaegCf2bRILn/e9lRV
         jI2DDN7CEe0wNZe7uq0fKLMqAC4CW8w8niY4CWHHYP9y467RFSV2x/W4LgGW3BhPFY3N
         onBYTxgJcC+lcyX2mY939783f+62O72Qh/XxsSw7xfAisRXnqYtuZ4Uy3QChDKDTiLKL
         Hb8ivpks6TB/Mr/BKFs7ZawdfmV03zpVSm9LMOWtQ7uATC6CQayM9UQaUIOtz7xqSiAl
         EQ81vjM09PfXbu8WWlQBhGzwf1KMKWN6JS4GY7I2uPcOTtfTZSwxr08Itmv/TTMU7gG/
         eEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596256; x=1784201056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwEVV0cJXSPJJj4UNs7yhLlyqJbVus2sdd9Q6EnUG1c=;
        b=roQhmQ/fL0LnPLma2i4q2iaM9Zdm1f19VnlfB7W5OOCOgdMi/Xn824NphygTEKvhDs
         9lb87k3Ar1kcCpETvz1KHoEu9MSsl5e1PAMtmtCTMVi3mP0OegJLP2OwSbEveUwlThAv
         ZycdxpG1X45vB3udQkAyzS2onzshog4lJWHozrL4rvi7sQsNzk7ZNT7DLfmpuCCVU1a5
         eTVsBdi9u20gYDQvoovYVMYB9ua7n9QDjTrZwY/zidLo66cLsX6TpOzK71+I3+/ViT9o
         dfj7DXg2LKiBp1SEFiPfOJL0Z5m08a6hCUeAFOAlpm3fEL5Ty32zcEYP3NBITd1Vz9XE
         uhsA==
X-Forwarded-Encrypted: i=1; AHgh+RpREwJKD0x6xmzvcHcbc3qjAxZ9Bt8ddr4wFlwhhNU2I/ULcyL/49UcuYOhsPAiCzwHSgc/TtFycLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrum+6nqoURWrUZlW+lMUYL5r/WspkVcDdnVIxsQ4UbYxZgDsX
	4qwJj8rDzGVWp37Ep5GpDa1pVF+0WxZRgZu0NfJk3vfrerQ4Iog2oIKzeOepwwDzOXON0snKNJi
	t9eVBfoxQKgPvWyCNbPCtuCz66wLtWBkgBfJQe7GNdMS+m4Sl/jGMFVlBF5HeTRs=
X-Gm-Gg: AfdE7cltcegbbg5VXtAJm3xSqRm6FjWzwHTUdSw2MAk27tQsl1MQVdLKBNCS0H1KErB
	8xDw54shGhxq+mw0iNA+3i6qtCezbn6VVIJXbtm1VymtyqfZp+yMxNSzbK7AZYZqMr7hIF9unbp
	FYeb8KBuw88VZ+aMYcwr0BXEDPh+nP1W4EML+3r8NeGR3uAGe4HC409RKnLMP1zfsIaipn84m2B
	MGMAa2jDI1iFA5GSpNONagm6wotUL5MzLpPdJ+o0SNlpENfBnN+Or8wiZ8/1kRkVAVmewJex3v0
	/7hI7/MlQgOruYqkYQ2cv0Z6LJkDTqqsfyTf3d3bGJ5OjuwYiPp0dMSCVHjUC4C9+w4ak+CYfak
	NnaxqJVmq0Xev4xNzlN6bWn+hDL0aLfz+GRc=
X-Received: by 2002:a05:622a:101:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c8b512840mr54792391cf.8.1783596255908;
        Thu, 09 Jul 2026 04:24:15 -0700 (PDT)
X-Received: by 2002:a05:622a:101:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c8b512840mr54792201cf.8.1783596255474;
        Thu, 09 Jul 2026 04:24:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c3f5ca3fsm291927166b.51.2026.07.09.04.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:24:14 -0700 (PDT)
Message-ID: <97ee8a04-6278-45a4-80ff-29f1b38e0ddb@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:24:11 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
 <20260708-tcsr_qref_0708-v8-5-62c42b5fa269@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-tcsr_qref_0708-v8-5-62c42b5fa269@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExMCBTYWx0ZWRfXzKMTAWwWVmMG
 zbinLqkRtHR8wsLc0jFf6QkxDEPf0dOl/tc1v3beDDdmrZu8v1Om17EV46zLVjmPo8fuUaJrg2t
 cbXMyolzCo/tc4vnrrhRJr8advwoExc=
X-Proofpoint-ORIG-GUID: pHfDeexEVGzvzYx2SrxbzN1JC5l7uXaA
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f84e0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=B6dnFezVkazQL_yb00wA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: pHfDeexEVGzvzYx2SrxbzN1JC5l7uXaA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExMCBTYWx0ZWRfX5eBvEI4D9c7s
 tHYgQ7RTAO9i6EYgM8N9RsTBsyZwu9+9cYPKwl4IWxT4Z5cSnUIV6H/CqVVjXY7Egn0lBwKuMlC
 Kz8Hsjhq9Z9Ri9pP2xatEo43BJUB3IfHgrFNaaiFN9LlzMoVVZ1vALwWWJR7247e35sjs7HBSLy
 7rC5G4czPQ4i3qWEq0cgHg0L1hwBQVO6bvHXUQDNYooyB0MzdTqNkT4y8gGHsGvOF/OoHC/4HaU
 lkp0fNXorYrrvZGogRMVqxFNl7JKfZ/THL2QdOeKLDT6PGLH219mOanPfWd/pe5qG0zkcd9yr4O
 GmdWRZR/xrmjk2M8dWLQ4ikG42MKkUCu/DRiFh/lnah2v17NH5q2lY5h0hOeUHfDLJemum9uL/7
 zQeT2RekY7vj5q4xOG9476cG9x3LUxAaYCh1ufZTx3j85KO/tYbWAWZrxgvatwNjWIljypAALev
 mHrsF84ddc33vsQJ5Hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090110

On 7/8/26 12:02 PM, Qiang Yu wrote:
> Mahua is based on Glymur but uses a different QREF topology, requiring
> distinct regulator lists and clock descriptors for its PCIe clock
> references.
> 
> Add mahua-specific regulator arrays and clk descriptor table, and use
> match_data to select the correct descriptor table per compatible string at
> probe time.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
