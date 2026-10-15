Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280184A4852
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048485; cv=none; b=Dk26asDaiOAa1w5igD79YLcrLVCo0n4oqRBJIPYAuK5v1HhLnqKfIOFyzpLztA31sv5ZdKZeP3sMYJahvt+DRX3RtFq8DTJFJIXFX83Gv8Zy52yv5aYEkIiZa2XuN76Dbx7T6312yFzo0EN9ih3At5acPaO0USRTDjlD6ddgexg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048485; c=relaxed/simple;
	bh=uko67U/o+/uE1QxwkAOnARE2HDN0VUWZgA6HGN5aKVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgbyJwzxhmkmingQAUIZqwJiSmIW1KG7fFoeqXcrPnd/ke+TTwN8Qb9M82S2VPaH/zg7PU59BM71k64C4gh9Yt6uALV213MnNRJ1+/mgXcwzktb5zk3JQzc3Kr2P8PbyhKMOdy4HTG8d9Mnm9zCt4ZJWvBzApY0g9Y3/QTnJA/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTD9IyRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmdoeNGx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTD9IyRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmdoeNGx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xdBh2738735
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	US4YUTXOt7NO/nrwbDxwGiM/cowbEz+uGqtDsmS+LQA=; b=CTD9IyRazc3AEoBL
	FWTpki+wdfWOWtwGXQbVlwKeTCzDT1PUHWMwd//DAIBTtTeoJm5c28k6RR6cpLBa
	a+xDsTUtEiZ1o8S8nhzp/vQXfOsKBubqQvgkEgDatB/TtRTAemnRUGPgetouy9en
	ttgJFvPR0Zn2j3tbogHMTOhQGDIA8HB8vn0fhqYHKUI4BFakGuRTYRpdaQfSwqR7
	CQ+99kXf5cTyn1Uk9tqSEbfdLSmVz0r/CNsfX0iRY9FHCVEpLWA6UvxdUzswWgfQ
	EPQKlU+uX7rEz+r6UG1CGF4tqb9Ju8yHGwSz5N3F16zalFwOi2l9btbBWohWN8T2
	Xdf1TQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds8nm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:14:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso7503793eec.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 00:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048469; x=1792653269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=US4YUTXOt7NO/nrwbDxwGiM/cowbEz+uGqtDsmS+LQA=;
        b=bmdoeNGxNRtbjnHwhfgd83lQMCcmZv+J36UPT0BXN/LaSPodBgGjXPWjDkcnt3IamE
         ggv5Yeg+Vp9Ugd15QdS+Y7vSZMAyYTHpX3tdUz+4X45ovPX6KIuVut7kufSDjDOjqF+d
         FqprNTZFMvuKpyxgiN5gRncGWY3dbH2dcE33CMVhgNDFwLo13r1A2/e9UMHNhyEpNexc
         dR9sp91xNh7dEttB+konaE+St4gybOpWZyl7nRiDdJ+uUQFCsZ6ReEA2ZbAKpiAZFI3c
         aGs1BDEqc9PQdBN1KIcNpcOmDatwTJUaP19phUNJg/ySPJgEREl0fLW0SfN2Hnq7ktzo
         srkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048469; x=1792653269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=US4YUTXOt7NO/nrwbDxwGiM/cowbEz+uGqtDsmS+LQA=;
        b=u+q1U7itn8536nqcEi5BuD2TeA20+SNODDY/AlLgst6jdqqN+BJn5FmLpSpCA7qLLl
         QSaTHboKU3J32fwl2lzeXS2Zhch5NIhSP4OODRkFMS8efgjEW9jSC0BDVB9/wtJNHHHJ
         OqRNWOjdD876jXBy8eYOYULAOibR6hhknt6djI395tcwKdMsHXrpqxpLyRTim56mr+H6
         NQQTD+UXb9UQV6B9LDyX9m5Roln0PgsU/glEbQI/KOykr+r9EyShgNfveg3FPoaWwgqJ
         EcmUlUYkhYN0wFLi9znbyDpYzLQWJ9E3Vp/PzkPe415wKy+lMikY+PFYa72EHlvZ5ZqR
         VLWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFB+Eab02hue+/vT7oz2GNudz/Go49G7XEwQLxupmfhmU8COxU1Wcc2CuXBgSUOGvZ+zLK50jNv8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuT17lAQg62Y4ylDoHS04VEStMvJRq+/iBjgy61m6TNQc1asrV
	5v+Qoyjtq0BzPF+lQ1djsSG7qUdv0vK2lhQ8+YuOh1hgRsUvw7A8bagqstZkP1F8D8a2quyZuc0
	r9CEkj6uffB7Ctpne+czB6fFpXECxM3YnuupIpHX9iNjuRTi+IHimGyxvpGx9Xsw=
X-Gm-Gg: AYBFou10cKOpKUlwQidNIV1IQBjLD3G/z0EYtdSZPg7Cpy08cQOKix6CwL+nMz3LI/w
	TFs6nI5nhVyC1yG6830caXmP7FbNKSlNngawvsNXhSFKEt1Xy12+yCAQkkgsNV+GH+TkHToZnUl
	+dt6Vy0vcOPl6xeFlO+kgPcnmt1SVNXyOkxjtW/vKGrIUztsk5yJDjpYdGHDYrAD9sITBbds93G
	z22kxcVO2ii0ve6Y2yRO1/vanKL63XR/sR+5NOHtaYXELswiKFVe2/vUsLe8RIcp8OD3F+u+aH9
	6Ci0/iCRuiYlc4tRBEStxBwwjJgUryCDFHMh/ovoSeUuwp6YH7VSoRKkOElt6VoFezLDdOnurbM
	DQLyiBe25zBlu2hi6mTTa4nFSiPY=
X-Received: by 2002:a05:7301:71a4:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-35a4ae61ed4mr16226416eec.22.1792048469373;
        Thu, 15 Oct 2026 00:14:29 -0700 (PDT)
X-Received: by 2002:a05:7301:71a4:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-35a4ae61ed4mr16226373eec.22.1792048468803;
        Thu, 15 Oct 2026 00:14:28 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm14059954eec.25.2026.10.15.00.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:14:25 -0700 (PDT)
Message-ID: <0cb8005e-964c-43e2-8e9d-4e955cf2ff90@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:44:17 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
 <CAD++jLnqCipTxkOhiwQhKFymOxu1HOTbHzLbNrGTOkCO33y8Vg@mail.gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <CAD++jLnqCipTxkOhiwQhKFymOxu1HOTbHzLbNrGTOkCO33y8Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dLCVcuyuEjVTBHn3DprdAK745pZPlYcg
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad07d56 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xfIMX-YVTLGOWNOYmacA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX6d8wIPS7CFpS
 dvoQ5w0zY1zIoWdmiK5YPgfitZKG7KZxfudlK0xJk1FuRXMZVn9oXkBgN5sUrPazNkwg7CGqU+Z
 sv0LOkYlHnwz3DH+BOI8j0OrE6lVOoeFZIwlfI2BO9XeYEanORw4YROl7MH7NL/RsW+NvwpfuVO
 A7rN0hDrvb5FoZrqdoUtE13D8xPJbXvT8FM+G11dUOm8xpBTBnjkkBoEW1TiabXoNPdQb3TgjDm
 lfeParn7u4j/ul5RQ6CKlgXTPrmdpb0LywjOuHIoMXRdrjwz6X/gO+z1oxGZ/ybOabOPSKfYtP5
 hUG4da/KU78r7H1Nun9bbH2+c82tiFX370t06WbqyLtlMtc6XUq2YiI3Lzjc3aSZy4L1h0oU7ez
 XJV5gcS/sFs9Fg9BKi2cKPuSVpTzQQXf7I5ou9kyY/uJn/G9jTcB/b5ZpRTFKdUiEZZ/kOXa/7X
 LJWhxfGj1+OI3n9UdXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX0lH1T86Ce4Md
 x2nosSvAawA+pLCP90004GHlWN/xDYPS+IxZa1ibd3ht5Is/kvfotXjtxz7zCq+h2mJK/oAzv1R
 y628S0Bgn0CjvWi45XgEly/W+MR5/8c=
X-Proofpoint-GUID: dLCVcuyuEjVTBHn3DprdAK745pZPlYcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028



On 6/9/2026 4:13 AM, Linus Walleij wrote:
> On Tue, Jun 2, 2026 at 5:22 PM Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> 
>> Add the gp_mn pin mux function to the TLMM pin controllers for the
>> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
>> divider clock output on a dedicated GPIO pin, allowing the clock signal
>> to be routed externally.
>>
>> - QCS8300: gpio32
>> - SA8775P: gpio35
>> - SC7280:  gpio60
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> This looks all right and no-one is saying anything about it, should
> I just apply this one patch to the pin control tree? It doesn't seem
> to have any dependencies.
> 
Linus Walleij, sorry for the late response. I will split the patches as
per comments from Konrad.

-- 
Thanks,
Taniya Das

