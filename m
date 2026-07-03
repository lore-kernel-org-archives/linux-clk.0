Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823983191CA
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 07:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063176; cv=none; b=pETt+j4tmV6myMcug71G35dIHOPTYHOgHJxY8cVk1DOg2B82B143fXp8r3sn5VwnmI67MEwhCouNrAI/UwLd7Icip2W1Xwz8ykEwX/LC+bmQhjfpzjXT7lSENgIWDBTtmsNe6SLBfmzkEVZ1iAOO733zKF+xZaz4B3h6dXTMVig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063176; c=relaxed/simple;
	bh=1BCxRF2o+/JRgWZS9sS+EH8vOIpCuHx3ZGtchgE5LWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpNnUndv8t+K5ZUFkyzu75IMt9AdI7le+lfB9NZJsH07niXLk6P4pQJdiNdvAqQVX/WvSrT+W+Fzj1UkxCsYQE74kmgdiqt83AU0yF41XWbYDperZ1sV42N6LiClvk39QF3Akt5qBRdQ/QnvUP30btLRxTKoUdckEbRA6u6ksZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oREh7p23; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDrjyGfN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oREh7p23";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDrjyGfN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s67i3110488
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 07:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8xvpK1OvpXpCw+B9QtZmezDI8RLmkaasieIGKWqZbk=; b=oREh7p23boKSEvoe
	HGtqMiOS3JkJZFu6pokW1nlogxvXspqos5SnhWGkEksNy2C1Cq0T0zyhdKE/p0sF
	fc2wW35VfduRT2+DUDlVCZtEytpIVzguM7TQgZczpxmr1TwexG0dR1iiGK2R+J1Q
	kkuEUt7Kx6fWXja5qUIw5G14qWGUwKmtmUNSLzo9oxecBkOlv9vTgMRNn8Yh5P/z
	RBLdcCFcq35Wf+kTkySrrR6G+xLKJZu7RiWgexskAQakgNawyIEgNFRbLEynfs1W
	ye6unbAW8KBNQsDFrYdVPHQ34ddiQ42ss1FbHJpKMHhVoKD28st6xxR1tadtsoKu
	GQ8Upg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60ey9unj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 07:19:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so622881cf.3
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 00:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063174; x=1783667974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8xvpK1OvpXpCw+B9QtZmezDI8RLmkaasieIGKWqZbk=;
        b=IDrjyGfNQ1IRfSz/qxOs4nlsh9MRk0vAjlA04Bu7Yicd/hcW/nUgYKzqByOop3f8Dw
         hHWT402b2Sqlxgbm0sqDOsrtZrpQNbP9lpG6J0gol0aA73APftqMBB1xUP9cLsxik5Qe
         mDTksTnZGuzTipeQL6oimARta2KbyNn5uCki5ZcvH5Sb7WDpi7ITQHHCZfATBg26HY5H
         ZxR7AEugAyY2eIHVlyrLyO67azmVl++4Q3nLntKphUx8P7uhOsOiIG69mLKkBuP/f+p3
         JhxCuxuCoWa+fvsWXEtzXd4KrownSUf4POsaZOJb2eF4DAl471WcgBfPxE/Vyz3fqF50
         AN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063174; x=1783667974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8xvpK1OvpXpCw+B9QtZmezDI8RLmkaasieIGKWqZbk=;
        b=e/y0C+Td51H6hpM6DM4njxdPRLEoLuncnjVR/Zn9ItS40YvVlB3/etPbWvUVMP8bY5
         4aQuF1MGKJgO2n+zXjQKzmkhp6KOTfxCTl7IfOGcGdrdpd/pGu+Ep7hM1NcRMrY0K9hV
         edu9Vx1rxjJVkUgxZBwVHhX06QCrac+MTv0IEWjsK1/bxQJq5PCzx5xDeBkqsZeaX54o
         7dwesV6wGFKsW/jk9/ZL+ppKvuvsUCJ3tvd53db7lcMZ/Atadcjo/mXCpbZwSSNAdKV0
         3RIkdUJjpt9XUU4zm/r/yPjE8EXsKTgqtDQFB6cOWB6TvHO7wlghY4BOLRT8oA3zXVs7
         8vQw==
X-Forwarded-Encrypted: i=1; AFNElJ9C331DkSsMKlKhIWUJpUteyRw2jWkZAC9miu6lk4p4y5SwC9avvrgb71Jc4LkIZSwNpByLTBKH7d4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEpuh63LptDl71nY3aioxhifrny8SKQ7a2B7cdQ09E2vytrxTz
	YWQrkXp1SVOJuWp31DZJInAiMLAHpfd2Zjy5Jh0QjQz19MsRLdJtxnQKeSw55EapaUhqUt3pCTw
	VOMnP9X8cO6v84qc1Hd/BsiSZAl5XFCRV42adPU5C+GTkgaO0f9JoMBmjWmfa8Eg=
X-Gm-Gg: AfdE7clM6FngvX1cCYBWkh01EgUvg7VNOWOjg3TmVryRRcJjn3T3wIozhLtBupBiS+P
	ZeoY1z2UZvN9nTTRCFhrbSHDE+M7RDnDLOEmRaWBrE2ZrPw5QD40SajyS2bSNzbgO3mUJmKC22t
	rmv3O8Uv7Pa0Ye3XBpV37LEMfTJUgl1FCA/a2lAQlw/0OBaPs9cFRxfmTo9g6cEw6p8daaN3dmh
	/DwK+z6V7CVNFgdTWn4bToeYl1ki800ZANfG1MD7Vkue8TAfCDietrklEc/8jMRVHB6CW7Dqh1p
	VYrN6eGLsfQgnzAiQmWTbN/dEyFhHs8GvRA5BjaWyHy+7+hADV3lrRGoAdoGvNKOYKYQZCjhRtr
	LTEQNo5XO9HplQHOpF3Yl8jViA3vdetQY0i8=
X-Received: by 2002:ac8:7e8d:0:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c26a41ddemr93225671cf.1.1783063173808;
        Fri, 03 Jul 2026 00:19:33 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c26a41ddemr93225471cf.1.1783063173438;
        Fri, 03 Jul 2026 00:19:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6055039sm236606866b.4.2026.07.03.00.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:19:32 -0700 (PDT)
Message-ID: <e42a2ac2-6a2e-49ca-8396-b76fd0921178@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:19:30 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/19] clk: qcom: qcm2290: Update DISPCC and GPUCC GDSC
 *wait_val values
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-11-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-11-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OCBTYWx0ZWRfX0t8irD97qMCQ
 px473XfGyV8mHmQH2doomaSfG1KO+XotSrPUsB2wn/Az1gf3w2FGWsSGwsv8gf02DnCyeuGfP6S
 4UCQfLc5HsTJ3oyUzvJmEjc38IUyRB53bQzwCG3ZHrD5CqgG447el72MTK1LJFmaseBaE26kv62
 nuXwQ5h4y6aiRbfUe3XDSo2Bg+IitOLEGy+dik7Pm3cO+Q4Z3x6vqFigZUPgbqZXIOPgIjy/4zg
 S+acPFvoJlM/N/hYCQ6fZACIvBzRKh7fFGMoPei7kpKGpx6Kp6QVBY5IFZ3I7VrhO39u8bFuPz6
 FLJhwQg2HkhUx7ivcCfBqrZPZCoV7Xt6X3H4CsZ9bv21zs0JV4CBsndBTbFg2LLLLIpT7XkRJiY
 nAhac1SrNHCiLDYEQsfV1wekg1co3zoQDeoaIf5PeNGZG2Z3lDin2RnyIe4gMuDsmHlas5KECHm
 I1urh7Yfn69ADa36bqg==
X-Proofpoint-GUID: MHSa66-z_vKFyEuKACNHsgIDF-5tnetN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OCBTYWx0ZWRfX8vEAdK+gUBnD
 diVJWFBnb+Nox59spBOcZ4VEw/gSbFjDmRFEbP6gTNK31BgBehDg7Y03GNDKDPWw4WQwu5seH+g
 nGiCgB5hoxYcuQA3J2UsF7C56pC9wZs=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a476286 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-A7SvAB7cpwXWzMQEzkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: MHSa66-z_vKFyEuKACNHsgIDF-5tnetN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030068

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Update the QCM2290 DISPCC and GPUCC GDSC wait_val fields to match the
> hardware default values. Incorrect settings can cause the GDSC FSM to
> stuck, leading to power on/off failures.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
