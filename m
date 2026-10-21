Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569992;
	b=rOvC1I38oI72/SGeXJmJdZrb1vFfTzUkWG17+aDCQVfFM+AMJ8I4Pu95eTJlxVGB3X7I
	 QvXCZ8NCItB+5zQ8/EYo5L85NI8IEYAHslAT14E6VcdM3PH06xsXLkK+kbCPNGFJgTlTD
	 xiUkH1uijqjoFRFpcZoQ84bpiykBHinfwlVEZS4A9j8ZfZOVbLyI9yOOZPmAi8ILArRRo
	 Ti1f0H7Q+4+ZRHwANwu7liwn56thG2TzwbuNwz+huILLWbF5EGnRZ4SzUQeDmTmam4xvO
	 p0kICJTY6xQsrmVpZwMLONOVCa8cNzq+JACuoc03dV63SCeavfAZK+benaih3iIgPdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569992;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LiOs04YGXLTIFXmdwEgbkoJICneWkcQrh/KS3klkgwI=;
	b=GO1uiDs5yk6uR3LY37a3iXgKqqmxX7u4gKsr/gCdMLva9JXpLnwyVaOosSMJdIUZRjbE
	 sAhHU4Q/T9nS/FwbUvG03Qdd8pKwqPSn6sqei2KeS5sSQKMO/o6ScWYBWU+tA4aNvUVqe
	 j7XmeIcbi+IEqcn9EJd0E88+E9ROKxJBllNDMBj8E5mSGWbgOT296KDxdW1NyB7SZPQy8
	 1suFtSvJA1hFD3K3bhANFwCbS8rCaWdTI724f6i8JhVHdkl7j3bG6ksPZ97rkIlcbQN2y
	 AMo1gzPFmS03QKfXCVR/+7BzfY4tQRvxI5qV+Ot7r7IDMPtvR9zuHTwrKWi2/xMOI+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eG1X3yM8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RtCTmcEn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EA3606A31A
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48EA3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eG1X3yM8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RtCTmcEn
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5ix16756329
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LiOs04YGXLTIFXmdwEgbkoJICneWkcQrh/KS3klkgwI=; b=eG1X3yM8s7cBfup+
	7FRm0p7sGm9xEClsivOl9XKgz7XNgMjPqlUJvPg7Jye5BKzc4qZhobz7R6wn13nI
	/IJsVf18d1knSYEL4RTqmUuNr35MdgJ+xOnrl8KgMulRlxQmsQB6yll8IKFz1wyi
	/bcOwwoOipOMQv8VT03eUe4/iZR9YZ/U+5bt2xwWkF4482Jwj38xc8OBw8sG/dxj
	D2qe01p7KnPp+A2V5HQzLK0uz8fe7THidg3/fnLWUH7+drWLlYsPd9eM1tFegSRG
	Txdz2z12phDT8f3AVePuSIeZ0YN10DGV2XRvGvNjBplzrLfCU3b1UWdU+9MrqdoB
	RDoIRw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4tpgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:06:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5350173dc7aso1418681cf.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569989; x=1793174789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LiOs04YGXLTIFXmdwEgbkoJICneWkcQrh/KS3klkgwI=;
        b=RtCTmcEnPaovq+c7Dpppil+HcJ4fw9Q0ifYsA0X9m9fpybEF6+GRltr1RvxGQ5+47g
         RV7/GbG1noYa2LMyGgAXLlqstBI1a9x6cfKXFJMmP8GvBWW8Ng8g2xY5nJytaZY6WmB3
         DDa5usiPHkUXZIlsdDyBOGaGFIYPICZxp+Zv4v4D4QbvW9lXOtsrUEgyFhz+xP7NG8RQ
         QvUjQrWmid9V0KfwWoJPB6J72uS0f8ba4wFDRxxCgIHM+FgPH3L14Nvh4xcTva+hPeU6
         NK6r3t6VGaj7uhqbRGAg3iHjfPS09krLhm6w0pszFSuzEPadmvfqB+nUPgb4dcOKEAat
         PJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569989; x=1793174789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiOs04YGXLTIFXmdwEgbkoJICneWkcQrh/KS3klkgwI=;
        b=tiEgKN4lavmjXvOZCA0vi2F0JYn+oaKzpZ2dRlUwfqO2G7GaXKYhj+9q8WzOHLVccI
         mxJPxT+xc5guDR8cEDvd/eoWg+ATPqSgtOM5PXpu7p3NuQVD+pNsFIGU/Vmq6stjBipG
         H93jWVqIXkRshDETbMRY5rs+/sDNVH5OUoPE41uJ2nlwKxe4btvvcKBIfe9TpmuvwMla
         E8MmNjbKGHbvkacy9mKR09lQiiaYK6OqvSC2r2LyMnD7iN4XP0tK/IP8iu8WlU2j5MaY
         dfpmOegzRTCi/v1Q5Ds54X+vmSVevYqnAyGm8FDG/qCIseOzuL4Q7RTUTGzPU7z3UGmA
         ghGA==
X-Forwarded-Encrypted: i=1; AKwUvByd/znL4IPJT/kU9BbdN57kzgu7I2buKzoQSJZckFvS3WK/85+W4E7YPJMAbebtBNISKPAHQ9Xi6OE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6CCOlUIKuqTh3sa8wCsxHJHT9oYWBEHpWQfWzoPQ9RveNG074
	/kZtrDyu7ajJCURwr1XdPKuPh8txwjI8GXupU/R+arFyw4LKdU9WoDNsSw54Gei5ziU9Vp3DwLo
	7STmQZcXQYI7L57Ya4F3gmwUVjwgx9+DiLi9RIuQQCAGLHWL3yT+RR1V5Lq3Zl2c=
X-Gm-Gg: AYBFou0cE02sS0pt+iMp7Mgo8R6TfnU5IX+uQkgT7L3ZkpiSUU245f5LyBs2pWrA53V
	IC+wkBz/BWQb6K09eIq75L+AhfRyiaKSRn8q45W9q92wKmN4L3yN9Db2VDmBIsJdjMo5+Xm0eXL
	qo1idLXwuiR+hjn+A7jGCPgkJDjczgtF3coqBHyhn7lo66FpTxTIb8MogxqkZzv8/tKTP6jxKF2
	+KVN24BYJUKp4BrJW1oIlfbKSI8xI/CJbRMjT+AUkNTQxa0vBOfjaRQMiR/fO9MivTn0bGO1TP1
	s3scOZXPCwFPKLiHvNTqJWDtHtSpSZa6kPnLiL3nC7K23w2rtzyzdx3yZOozpiEUP+4LeokbtCK
	gJ5wzr8TGIVL/R+tIK4WScg==
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr26472571cf.0.1792569989416;
        Wed, 21 Oct 2026 01:06:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr26472251cf.0.1792569988977;
        Wed, 21 Oct 2026 01:06:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f77729sm50471066b.25.2026.10.21.01.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:06:28 -0700 (PDT)
Message-ID: <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:06:25 +0200
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
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Robert Marko <robert.marko@sartura.hr>,
        Julius Bairaktaris <julius@bairaktaris.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladyslav Andreichykov <vladdrako007@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020065430.1251541-1-julius@bairaktaris.de>
 <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iafQbhwXk2Jv2jp312ZqK4UvnIK9Z4rN
X-Proofpoint-GUID: iafQbhwXk2Jv2jp312ZqK4UvnIK9Z4rN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX8l0rTj8BbUPP
 ymIYXVE5jzPVsA/hvjPpqu+RsR2wLx8ENSHEtFV2rWhQUXL9tD10CXAjfG/Ve0foIRvmo258yzW
 MhmpEi2noHZIT5wV9he3kNnNs9zfQFc=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad87286 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=8NHwpXmQIE9AyX7o414A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX04x1zzlTAcz1
 Rs5PSXFl2cygcPcFDmJWSkT+H0tP9e9NtEVSYLvxUbNrCXAu6iagd0A6dNp5EEjq5Qr/nvm57aH
 97IjAIa93Y/BaMs6l6Z5Ms8KI0rC4xLfzoj8tUnSJYq9Ag4hSqLSQWTNgpalQeHgpYc3Gm0G3I1
 zsiR+3+rooO+TFeRcGrVoqBx/pUtYHE47UVBQZMbBYYgnWPoGbIRL3ef+p8ZiaBOHjvSvLvZ/Fl
 QqUblwnZNnq0Rz1Cw06uefEp6WcKJ6cEcIASRyMmp6agA2/tvor+rC7ohAVNcQBbOOrK3O4ttdQ
 Ksm5BAm0eQnCfkux0kqkfN5aoNg7eilAc09sGt9bPu/94K3uepUJe2QDDCPvVmBwJZ56wjiXgeM
 lM2BVliBir2vNYC2odVz/SVJhrBDfoQv6HvmtEi3Am0ebwp5HnBQY7Jgie9wk/KghBEKivvniwP
 3LGVt1wnFJhtqP6qUnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210032

On 10/20/26 1:39 PM, Robert Marko wrote:
> 
> On 20/10/2026 08:54, Julius Bairaktaris wrote:
>> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
>>
>> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
>> which takes its AHB and SYS clocks from GCC, so the device tree does not
>> pass them back to GCC. With only .fw_name these parents never resolve,
>> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
>> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.
>>
>> Add .name fallbacks so they resolve to the clocks the CMN PLL registers,
>> as gcc-ipq8074 already does.
>>
>> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
>> Assisted-by: Claude:claude-opus-5-5
>> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
>> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
>> ---
> 
> Hi,
> 
> This issue does not exist upstream, as CMN PLL is not yet wired due to missing
> networking, even then the solution is not to add global name matching.
> 
> The required clock inputs should just be passed to GCC directly which I have
> just pushed to OpenWrt.

Just read your reply after writing mine, I'm looking forward to seeing
that patch!

Konrad
