Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610043;
	b=hDAG2RVrpTbrvUKLBdJjuo6bkKg+HaG2wTlQh75XWfKgCTQNtDVYPGock9FeU8nQu4js
	 K7SN4J1/gUb7kDFskXBkvoyaGA7rGys1W/8eGdeywMNXeF50xLyk1b/kFMxEgJHqtqkpG
	 K1Z3Qw9aIR2EpgqoCrNcANl0g8LsD4KEC6mw/vwlCIVSiAI10O8I/QhWPSRBPXzNrHo8Z
	 1hJ/EBDyR02s+RO7Kl+k/ZpQ7jCYbPNNaYfQql49yGkW8/OC4NCu0vutN82RJjxI/oDUX
	 oQGbcIQ0Uy3sIpa2Ox1wXK6TIWU/A2Oa8GUhjOr4CyAkgfCjQ1NbtH3oqdhO8JmTd/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610043;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nOcvMumZzN3Bc76fhfQiJYSnzdlCLq4dg/sHISVji/Y=;
	b=A+fqlRM3LB3HFIzbOz9brmW2bs9yDSqXY10cTqLU7Td8TMode0y+VyPx90yn9S1PkdqX
	 jw+qBt9tgt+/rgDY+mnrDlFXGS8O5S2+amk9QLrJ8DxWlPRwe/HrosCcSoLmQntkcsuu1
	 TL27HFo633ffo3inApCCMYASQhNWRim3MWcNMXOUl+mk0sm0IlyGIwaaJuvRBiWmZ/FW1
	 5IU4jsqhAd7sQm5Wi6AqUnc4JjNZj5cMSny14s39DBgXQIGiH04zKbbEPjp4OymVwtpT8
	 azQ9eoxze0ha4nt8Xm7P5TeST/eInur79lKtRYMNMCJPgTXIbiPQLDKi2errwbbNmpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eRE7g9cP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WxOuZsGq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5E9606A326
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 09:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA5E9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eRE7g9cP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WxOuZsGq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A27nLl43220251
	for <linux-clk@vger.kernel.org>; Mon, 2 Nov 2026 09:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nOcvMumZzN3Bc76fhfQiJYSnzdlCLq4dg/sHISVji/Y=; b=eRE7g9cP5PFqV68t
	f2y3yy2lqItpjGOxNutZBZForDbf4pvD2iJ0/0gWMatRpSt2Aig6WPBLEBY66fNF
	8n6mdkMe9hoi2jz8sDxP4Vt+H+Ye8Zg3bLhsYKGm2LwggATEHxxmuOHjiP1tjdLm
	7RRdl/2yvs9q5fhpb7S9I1q2kUrwe0Vh+nbpHuZsMtuV4sNRU+1GZ2NgIa2W1Waw
	bXNN+mgXFqxXc4mNqZmoK/65ejgRCRXfcvsF5SVO/S1SEdIPdWnvuAHVkCQ9+L9q
	Aur6Wo+J+lCDCnRVAaq3BfC+qvPLNQKhRV4j++xuX69mms94srrfYPeqPReLWbxR
	HFML0g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe89p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 09:00:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea381ce04fso34986635ad.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 01:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610041; x=1794214841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOcvMumZzN3Bc76fhfQiJYSnzdlCLq4dg/sHISVji/Y=;
        b=WxOuZsGq69M5/eSuRGkI3FZQWdSQjOkS7rW2QlRaLK+S6r2ZHizStMAmtMvLsY+UP1
         KXOztXiemyYri4qg2DxEIytMsWIAcLDE+ozZPc8Ik2IQf1K8LsnbxzLrREjkR2pZytBk
         0S7GMTO8JqgRwe4fVo04mbORBDWSsPbVsihzAKH8LaNq4Kfw0rpx8yVupdN7vUuUShrp
         j3PpADUN5Aep/PiF6RZiJFNrOnYbAghIClyzdVOn9T3Vbk6/YqGthutGbttSwS9vxkZI
         KrMGxLHeE1oebBuAR5iHsTmQ8dMN3KRAVeIaxNEt7T8l7xDPtZ+ZHEXay6gscPYDntTi
         AKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610041; x=1794214841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOcvMumZzN3Bc76fhfQiJYSnzdlCLq4dg/sHISVji/Y=;
        b=xHFHlwrzV/Hs4+srzgxJs0/GCeqijuopYll4h3uUJUtX+TOYM3zNet1UHY2pMh1iz0
         ImQ96J3+3xQO2tTRjYfhI6Ii+LvnUM1WcAzyCqXgy58MhZgNoHSejRxMWjzkzgSlrQR+
         h/OnMUEknXUHSMmc6+wazv8Xj7JiNvkjiEgfl9FzWD7XFklOWfZxxEz/8vodwNSwS4Gw
         q3hkceY1z3aFoFnhnxZDG7HZrg35i0rxgeR+ULbw3d6frkOrS65s+w/C+D42fm001XM2
         b0uLq+Vk5lqDxb5uAgGcYPlSXnDSdAsVQq92OF0aAIFkV1hATPToZBYIFPFp7hXsyRMI
         EBwg==
X-Forwarded-Encrypted: i=1; AKwUvByFJQSuaEgWl1gsqHIvnySvN+Gxu0x5kqPbbqOUQ0l3DOZp5XdG7OLusEWr7SA8JEEyvjhppF5T0Ug=@vger.kernel.org
X-Gm-Message-State: APuU4Z88BYpvW+JgAkp7qeSLi1LdIzgEOfDG+SXwBQ/Y7a++yGdQwaor
	79de6vjlQSFm0Diae1fPnS1ch9wiWWB/G6AU63VBHPau3UOFVhaFo0hW4AAVknxnnhI8xWCKhvs
	KTX4jkajQeOHQVCb4VXCEaYHZELRIMyPxV93DhC+2r4OTUJSm93eoeo0hkNSn6do=
X-Gm-Gg: AYBFou2CqB3BxMJAFfuKXT8NPYPBH8c89rv68VLVVOXIZc5Q+e7ssjCpts7B2lzsHJt
	I76eencdA3eohVTTrGbXz0rdJmHEuQymicNfxDqrMA2CZ1aaTyNQdmm7clC2aD57pSfT/I2EFK3
	/NsPg+uN8pa7GQFHAHCvz/a6gGNpAZOqSixEz/44XMBT9tezI3SqvXgrw7pxI2A14/N0FBqgTmm
	uHdHWFbXt7G2WAINqToxdLApT9Z7Th8mv59XRvcpGwLGz9u6Y2Y8p41jh2d+4ec4aDRATwewu4K
	y3sRNk9ej7m9qT01GYqFRnlz4+lOu9CPgjOJY4ET6b5WdBjCWvmqxHLuqDL/X381SCTUKVSRyUY
	FHuRJZF5NugK6YeIIrt8h2xYJv4GCMqu4qSe+pKnykIoHhXXscukvVo972Y5vRBlOEzErzMgaFX
	U=
X-Received: by 2002:a17:903:1ac6:b0:2e9:5313:8f7a with SMTP id d9443c01a7336-2eb1abd06f0mr88117965ad.6.1793610040732;
        Mon, 02 Nov 2026 01:00:40 -0800 (PST)
X-Received: by 2002:a17:903:1ac6:b0:2e9:5313:8f7a with SMTP id d9443c01a7336-2eb1abd06f0mr88117735ad.6.1793610040232;
        Mon, 02 Nov 2026 01:00:40 -0800 (PST)
Received: from [10.217.217.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052edasm25048465ad.4.2026.11.02.01.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:00:39 -0800 (PST)
Message-ID: <c644812d-1b3b-4e66-9922-bb39342700cf@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:30:35 +0530
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sm8450: Use clk_rcg2_shared_ops for RCGs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261031122037.565113-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261031122037.565113-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae85139 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qS95yi5fV1RryunwhjoA:9 a=QEXdDO2ut3YA:10 a=Z8N5utuJXkwA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX9cbxOICrjcCX
 AYVfI87OffNckFYqw1k/S/nKlm1C9vmbvpBCpdp1eNxZqAHcdGlxgosY+Pgf+KsD6ymUJNZmOdi
 hnvRGCvJHnvW/X9wbiKR188+KsV67giD/KQDjpSeB9LFL8SZsDqcmWRe+MZ0ZqM6QBWoaeMCLyx
 IgmmMjpyz8+nP8PCL60U9jHhNhuw3QmNPxzcbYez1MPNw2ljjOdCJqpsHJmYaTV9Zo/478DhRO/
 5jzlDelxzdeftVuDqJlVrj54fMY4qkMNcj9CpIOQVfPFPA82uC1fr9M9zdZMGRjuMmPc+Gp3XBS
 /Knkc4qblwB4GoDDPAwK8XhO1ih1MYASGv1rxNNQiI+soIqA8mLEZdCcfXttEc62unyilxRY1wp
 r1Yi6agktUzlcIMuPdm5rsoMuSWQi4cnWKzTDPDOKprR9ZDKXoB8oYl5KpjEYQuIejrMRKHe1je
 exVh+4o5+1y7PDMt91w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX1w++tL02zIka
 taNDSaWkP9hoOe0aqnmMX83qfF6m/nx6gtHbU9ic4D1P4rEo5TtH348pFPx+3ZnV1Q43pEwNgXS
 rH83EHxLoSPCvgZ+UV5DwJ3ZxOYnzbY=
X-Proofpoint-ORIG-GUID: riu7IC9ZyxNl4agaJc0z-RxHmsVDBcw4
X-Proofpoint-GUID: riu7IC9ZyxNl4agaJc0z-RxHmsVDBcw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035



On 10/31/2026 5:50 PM, Vladimir Zapolskiy wrote:
> @@ -1480,7 +1480,7 @@ static struct clk_rcg2 cam_cc_xo_clk_src = {
>  		.parent_data = cam_cc_parent_data_9_ao,
>  		.num_parents = ARRAY_SIZE(cam_cc_parent_data_9_ao),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},


This is not required, as this is XO clock source only.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>


-- 
Thanks,
Taniya Das

