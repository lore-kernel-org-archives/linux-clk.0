Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313972D5940
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764315569; cv=none; b=HLVb5I0TLf/xvOTfKXl2AY+KGZbGNsVbWCdfvMlVkLUa4dpKVmDpLh4KTM9m9ojLJA16kFMt/oRh6uW+vXVZr21deTseQkfLowrBZMoaX14qPfqCzVkSeoGBJICOmq3bIiv/k+qe9Okco2NQvGWbXdHpmCHpVMoElAomZUeah4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764315569; c=relaxed/simple;
	bh=B1rH2VGakTd+82iKzkUmjJCkjBhqry8fRBZMXb/dbpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSQGLqAEJ8C0EMbL91rt8dwJ4+nK/DIlrsIa/qTGWOYo/WUFvjXwQJnvCk3K02V3/vZKs1M7BRf9zbfVJ6ojPmQGbZu/Kn7cIQyzPO0W2zg4Jy5oqod08EtVRo5cjytGB/4p/RLoGqAOE/E9Hg/e0cOyVhlxt6iUtj+v3Mfb2FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M31UZECm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HyS3gSum; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M31UZECm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HyS3gSum"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS531mc3762638
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 07:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shAh0Bol9pcCGzHnB/ctOWK6vAuHxbG4hKUYdNC1kBU=; b=M31UZECmIn28hMqQ
	CZzLFxaNfptXHq738uwFDbb7YbMhs12DlibTea1mGWNKRAilqxbQaBw5rGnxe7F+
	hiCUqGXYPE9um/dOoS2WrYLnXmL/jLHhzrBrYS72mAVC9qUs3+d5AJerW12so05B
	ojvjZPhHCi7cpbLaYvpH8x67U5YxpXGH1uJjV+ucRKF/kVku9E3DtUQwCJL13R3r
	hOEjO0REJKz0q3XB+ljiIvgqgpg/sKpvv1MoijsIx/4qLNUhtQG3co3zfD7lsVHh
	dkzW20zHXCxHsUHwnyxgFC9EkpJoJ540RwXYLQeeI6oF/Zr279XjEV/wHoNxak84
	DuJq0g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq58fgbx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 07:39:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7aa148105a2so1413374b3a.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 23:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764315566; x=1764920366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=shAh0Bol9pcCGzHnB/ctOWK6vAuHxbG4hKUYdNC1kBU=;
        b=HyS3gSumYL+CbRKbBk24Zz63Pw9BRKYTNxrAzHrErsdFTpJijsc1s9dSsnhQ90W+PZ
         ezSEqz1fZwSnUvh6GGHhkR3f91yEbVgLBHJqI4NLe0wk+NQlWeg4r1renYyABDKkb7uw
         7/ZM/zliWUz4VHaLL9vdbxCCVRO3YlJ2lcIYA1DK//EQs0i01hltWeXfqiIoTWR6DUtI
         RQgvqF6B5UZ3UcqloHZPRa0Vp3FyOCXxnwxgOsJTUFciVV9O/P89XG+wI9WA1EZbOKtE
         jGbO66IosztftfQLWQL7T7ye1jmnoDy+zC5VVDe73xdQ76GsIvTD91YIpLcF/FnbFloP
         NOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764315566; x=1764920366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shAh0Bol9pcCGzHnB/ctOWK6vAuHxbG4hKUYdNC1kBU=;
        b=OjPsh38Yjr8wD0c3rQiAGuXRvefxKwHLDByQTyJF44XudVyPiNp4WAVxM6olglHBH1
         5UGWUoSUmw3hA6MJWavjZy6eY3lW0686uFrFFuquKhy/OthIeQB/hsmgjzPlMXtoi/y+
         4EE0tXHqb02WqiS+bzDZGQn9U6xOQO8tbsROtHLcXBVNzTM36gj1jxegbDj0O1Hk1X4N
         PHrxFIipMrPkfi0P5TS6/3klzum1Jm/GOaLiW58H4sb3zLklfuhPT99W3IwyP9h0Tj+A
         CNsnDdI0BGRHilWcM5ysO5brfLnSjLIPb36H1yLgCf53IgT1Ge1pAJ5bnrCUA7NRWMze
         QJRg==
X-Forwarded-Encrypted: i=1; AJvYcCX61Fw+VhIDc6GwEUyipH0EelxspQwgz/p2ZQZAOatq1obGPjU+fglev52BMNfRjV1ZmpD+C7jbELM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHwU+c+TH2/3qjSN+QQzoONWXu62sbfay8xoVOe8cuTC/wfNSm
	PvY95DbaJ3ztyJkkhau7rFwuwydDlG4WV1bzkm5fMV2PXy4lSh928lwzq++EWYSKWCUIyx5BjaJ
	ecUH/l8KPiCpweRMsEagr1DqzZeuGHPd8k8PmA+ATYBfF2PKqWZeBj038SmVDVdk=
X-Gm-Gg: ASbGncvH16WWV4kUW2ITJFLHFCRZgab55AYe9WTh170MsStMdAH0UsTG9Z7qd91O9ma
	27Dy6mrA4yURhr+4DVffI1ItDbr96VPOaM4zNO/c56dJ7BfXjaBg+GMzqHN+rVxV2gTaWcrQ8T7
	7bKRc7ZPG65sBb91iCBu9vPp4oV0WJoB+W1LyWyyp0kUwGkAQjxQO6mxAhkgDXGXtsuK0nAytVv
	CJXBl0igcUGhRE96l3N89SYSVmUzdDtuiBiG6+H2ESHA+24M4Dmr8zjGQcxLmvqveWm0ZnQHwem
	hZpV9ovUNb8i9aZ9tFut9Udojb5btR5pyr7RJ6AfhNbpvHisiozROMl0QlsYKxB78AQoVgTud5B
	opMiMfH7FO2WxfkIbZbFtehHnZZl5l0P0U9v4
X-Received: by 2002:a05:6a00:3e11:b0:781:261b:7524 with SMTP id d2e1a72fcca58-7ca89969776mr16061722b3a.14.1764315566027;
        Thu, 27 Nov 2025 23:39:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IES7mwNVMOOPPEAyMVt2VKS57l+pQBcyiT5SY/rKK9XH3gEsL21mDCvf2glZ9qXXauOwtLl+g==
X-Received: by 2002:a05:6a00:3e11:b0:781:261b:7524 with SMTP id d2e1a72fcca58-7ca89969776mr16061678b3a.14.1764315565572;
        Thu, 27 Nov 2025 23:39:25 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fb1486asm3981423b3a.61.2025.11.27.23.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 23:39:25 -0800 (PST)
Message-ID: <fbf5c49b-d0c9-40a1-be5a-4ef21d8ee5ee@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 13:09:18 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] clk: qcom: gcc-qdu1000: Update the SDCC RCGs to
 use shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
 <20251127-sdcc_shared_floor_ops-v2-7-473afc86589c@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-7-473afc86589c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 04v4Q94IKQSfU87kuO5iJsivaqlNOmm9
X-Proofpoint-ORIG-GUID: 04v4Q94IKQSfU87kuO5iJsivaqlNOmm9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA1MyBTYWx0ZWRfX28Dikb7eEVWk
 HuRJ75nT83uyz+A0CM38zSgULC3hLOzc26t0JxKDarHdPq4h6tj7EstUVQlKcpwBrM/wt7WSLtl
 t0P4TGqMvwes05CV4SqDlYZ/b1RPJdqevESThdoqE/p6148Tlrn44eSlNyoZnW74QSmei3OOk2b
 nTPZyUQ3jGb3t6EwBU+dHzgNCmheiK07xmqeXmN3d4JA4sO8ks8qt91p2R/kzEvuZqMls61iPQF
 6u/E63nhX5m8G3qsgn6Pjjr911i1/e7j74uxmoLioVlD203k3K38903RxXOb+pJPygFv1WRwW/c
 F/HnLnQhD+OBvk48VK7sVmQ0KCYujdlbcvSs7SHPtoR+7Um/xxhS2C8VyYBPMAH6+bNXGqp92VE
 oRXtjUJcmoEkeyLA40ZxdCHUor476g==
X-Authority-Analysis: v=2.4 cv=E6DAZKdl c=1 sm=1 tr=0 ts=692951af cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OtGAF3PL-3b91V71RaYA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280053



On 11/27/2025 11:27 PM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: baa316580013 ("clk: qcom: gcc-qdu1000: Update the SDCC clock RCG ops")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qdu1000.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
