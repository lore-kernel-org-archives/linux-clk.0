Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887A02DC321
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710498; cv=none; b=uqDU++fbAlPc5QilxeV8i9dWCM355qLx1OUOdJYiXP19b4S0G0bBZFS6SwS86Mn5COZ//6J0/Rbf7suegGPHjOWDWwRBq9cIWFA/ggjt425y4fEwUPOwqMvQukcF8BejOWPxBl5AynnQMbrtValD7g+iVyvtbLlfvSEU+DIqs6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710498; c=relaxed/simple;
	bh=hf2YvkCQ2+656NeqJ7JOZlD5t5MHvJmIml02HR1n2a0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G8KbaXp/iJJgqTf9YYejmkxu6sp2e2TMpzK2J0al3Dq/mZcNh7YItNu9V00GO1wsl2TXYtcjjA1D0Ac7k5m590enfO0QQhO7WCvDTBhXGajeZQd46rK3GC2BY6ntboioo1bcY9eKCBwLoMT55RxTNjtYbh6pzL5J4STLGGt3Iso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWLrmMem; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMtvpbu2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWLrmMem";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMtvpbu2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NGZ91719002
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	topQkWEwcoqTN7MCwL5X+qwyPKw5DcKVugONuTUv8GI=; b=XWLrmMemubiWq0Ki
	5T5ufHvkCgvHGXku6QaLXZuueHswsXbuWgwxTUpfDAMnEzH6pRa7udnOFIZ+Jvnr
	5pCRH+CSta8dkMESeFc+bXqN5Kgft6taCLQMWTsf1R3+D6X3jCyuPWL8Vo5VgnJT
	KAsJjzv2DK7g9cv4+OYBd5/Vhk54Z5O+X79BeUXz2rtgtcUjFOFFERTiHMqjszAR
	7uZIUMGK8HXtS4+SPa/hR4FYdCAx/sgaT83f2bHUYe/VmTP8YNt1k/ehNUImCtaC
	r2+VBQ+fas1fyF46zFXMJeBMT8DFRqfjEJxJQu6hPLKSpVc8krTFXc6IkgcYjY4R
	7oOe5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf4eqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:21:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7f385887bso48043745ad.0
        for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 22:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710495; x=1783315295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=topQkWEwcoqTN7MCwL5X+qwyPKw5DcKVugONuTUv8GI=;
        b=iMtvpbu2Fck3p716N2XHLhKbhfX2cvaybd0oMPGCCPHps+TuYOZezlmYMNMY1rRv7Y
         jmLZfhfgrfjhZq+aI5Ca+TxBdPmkS7ehjD44NY6bPj6996r6rfg1aZwxNNkjna9GcRlK
         FjUgrwUVAIZSef53zb+fEUU98AFifkJmM7MRitHEgOEGIO7qm1Mikgn26GOAB4zcdq2Q
         mnjxOwcdGeaU3uXIt70KH/496YFmCUkJ35qmFNiWNmnhr/snQmJjxmrxwkjI4D2gpNqh
         oXTUmIjTLUnPFkarYmVXH2n5jBVyDz/uHO45avtGcoynWjp8IfCbLl1528/b8JSQr3na
         cG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710495; x=1783315295;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=topQkWEwcoqTN7MCwL5X+qwyPKw5DcKVugONuTUv8GI=;
        b=tMpd740KoYPeAT0S6sUziyiBwjA4TZGzXv21x74eW+A4yPtAUWx1aB2dHMJDj/pBZC
         eSb/Odloq8MrYnp19vY/133ySLkLTc6dRe5WAnu3Fjmo8AZgvw8nBYG7gNCS0ajfuwB9
         zlu4A4PUi48C8PU1M7lb7VfZwE9GsJBd2svf96APc51nA4vAFsu9EKp2In6WDbtWQDni
         MLhxZd7ZE9zw/e3dzJbXbnXnRSKGrN58rE0Yt53YLRm5g1ERCupMka7MrS5xStABbsb+
         gUU0IwBSTQiyyqeZog75QD0nUxXOLbx1plUe8joabvBUDobsqZis6RIgSySC+8044Rpb
         xKHw==
X-Forwarded-Encrypted: i=1; AHgh+RpAtRLDl2N0p0bJyJVXnLz9i6k9wF+6uspe21/yrUs+zEwR8Eo9Oqua7ijq0mUZSbo8zZHIErDe9I8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB4adbXp+lsPuL6UjPbbnrOlZCpBw8MpMvYUcf1e6qJPbHDRHf
	totQUjz3fTICmvAfUfYnS5GFGRxkctIa1K2HRLv80wF3RvlPF3vOI65zTXgZvbK2hFpuyYO17rK
	hN6ZUBAJEXyHy+FT6XUyHR6z7I/IT9ZCOXoHcAqmhse1S0pUslovqkWrlWU+UXRY=
X-Gm-Gg: AfdE7clFp3K07+NUL75yIdAiWGTQvHZXwIbKK1dRbV5YkfEAkUonKQ9+NvaA+KNkqv3
	Hn2dUVFG4nI3rYs//aQ3QzfkxkybpH1WE09GcN8FUzkJN3Jn5GiQi1g+0KaIABbI4HBGTIePCaE
	HWsOT/1cONU8pI/MyZNOHnBff+wNl4E4T7iRmcHJrjaDVOFdqAsSuE0iEdnN3x/sJJL0U16Fk0e
	tMc/P2PsofKjjVSdTHhwYbNszQ2nHnDxOUmNzAPdomJA02pajy7gGCV7OnX/0/L1vw7bk6UHUD7
	pyLZU5nj5/Wo1fOXDnuxHZO/NvHzuvZ9i0pYLumhvlSCm9TdU3MOiapIyLb5RYJVVOw2ffkYWA8
	YzAxZOh+nULrs5b1U0yKWCL2JVxJXuoR5xOxjWw==
X-Received: by 2002:a17:903:191:b0:2c9:c083:cd49 with SMTP id d9443c01a7336-2c9c083d409mr50062515ad.14.1782710495154;
        Sun, 28 Jun 2026 22:21:35 -0700 (PDT)
X-Received: by 2002:a17:903:191:b0:2c9:c083:cd49 with SMTP id d9443c01a7336-2c9c083d409mr50062205ad.14.1782710494705;
        Sun, 28 Jun 2026 22:21:34 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9d886668esm25607175ad.58.2026.06.28.22.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:21:34 -0700 (PDT)
Message-ID: <620be193-f49c-4f8b-b025-51f266f247ca@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:51:28 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra Audio
 Core Clock Controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
 <foutgm5vhldz3verik2mje22nrnu3r3z72mxah5wmmuoro4l2q@ud3nbdgctpjl>
Content-Language: en-US
In-Reply-To: <foutgm5vhldz3verik2mje22nrnu3r3z72mxah5wmmuoro4l2q@ud3nbdgctpjl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX1nzQna+22Pf2
 yejxlCLb93FXZyyvEJuKIzvOx+fvyb4Fn7b3cYH7/3NX+k+HlnoZLiSllwemrNgzZ6sAfpU3Kc3
 ttUG3c94z38mVP8a+/k02XVs7XU4ZgA=
X-Proofpoint-GUID: xn9eDPNr3l5Vl5vQORD0k1u16bOwxwcc
X-Proofpoint-ORIG-GUID: xn9eDPNr3l5Vl5vQORD0k1u16bOwxwcc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX6Cuw+0AmxFKJ
 7EozpOujMOeL8duU1+QjcutqOjQ2c4G4IjYqleafngvcUfY9NFPWTEYiKO6REIvRlNsiYxgxP//
 nMbg/Jscw1e3tD02A8CiT/CWhIw6lGEVkfEhGagsy0EvLY6NcXxaJoMKOuJU6yNTeJ93GtMeaRL
 NufMrmC7ZMFbVmFhs3xqn804IdFxjZtCTRARbzQAJB84P9oZ1dL5YbjyHq0ENpCzFTuqGRjNG37
 cw8iohbio9uaMOwvcSrk0rG/p7ri0U7QLTzZLyhyi9PNet9u8aWU/Xa2pa9hetcJW3qIUDCngqp
 gwoYysjEaiD45ajKnu9TxbdQgRHHy0iq0TvkYVeSerl3hR45yywkRzsKzKmpS0v3zBTZX3ZMThA
 ISC5MtfYWBtCY+Z3GK37c0phGYT6b62yltA6SJn45Ir9GQtqMfOCGLTlP7ulVm+ma/0ul+QUsk/
 6EUAhuXlJKnC7Y8jU5Q==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a4200df cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FQhjQoDDPVDRA2-OVkwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290043



On 07-06-2026 04:48 pm, Dmitry Baryshkov wrote:
> On Fri, Jun 05, 2026 at 04:56:31PM +0530, Imran Shaik wrote:
>> Add device tree bindings for the Audio Core Clock Controller (AUDIOCORECC)
>> on Qualcomm Shikra SoC. The AUDIOCORECC clocks and resets support differs
>> across variants based on Audio subsystem enablement as follows:
>>
>> CQM (qcom,shikra-cqm-audiocorecc): need clocks and resets; audio on APPS
>> CQS (qcom,shikra-cqs-audiocorecc): need resets only; audio on Modem
> 
> What does it mean? How does CQS play audio? What does 'audio on APPS'
> mean?
> 

In the CQM variant, the QAIF driver runs on HLOS, hence both AudioCoreCC 
clocks and resets are required to be supported on HLOS.
In the CQS variant, the QAIF driver runs on the Modem side, and the 
required clocks are handled on Modem, so from HLOS only resets are needed.

I will update the cover letter with these details in the next series.

Thanks,
Imran

>> IQS: no clocks/resets needed; no SoundWire codecs
>>
>> To handle these requirements, variant-specific compatibles are introduced.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 62 ++++++++++++++++++++++
>>   .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 +++++++++++++++++
>>   2 files changed, 111 insertions(+)
>>
> 

