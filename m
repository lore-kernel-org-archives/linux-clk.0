Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705FF2F7ACA
	for <linux-clk@vger.kernel.org>; Fri,  2 Jan 2026 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354004; cv=none; b=Y2el3ku6AL5rNEsFAJssVUFAaOxEZYhgi9quhOYQ/KrNqt4RwUBut+avrPbbGDj5AsoRY9ToCHvW8WXiig0WwJixXRe+0s4uVA/OpjrIDfasi3xlEljNXAuJZajyexXNnMZeMOUVk08Mu1dvdBQatjYdmF5KSfJ8mDEtPIM/U2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354004; c=relaxed/simple;
	bh=Lamw3DKXd+EDOviZ694M+MoTo/Zzuhu3p+ZsGdJlG3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yy7wNk+406mQKEBl9zd1P2NlWMzKHjwUsY1wzp5j5M2mOTn7oP/qsU0ziPFh/oZjkSo7fV//7ow3oa5dm0VL6CKFDYnwpYWr6pfL5IAiRL7rET7as2VGf6uzIiFd/tQ2lDjaza7y5SJtO4XB0i6DCA4BMn9rlHqhT99exSgrTSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHefxxyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUyJnYnY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHefxxyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUyJnYnY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W3sY809153
	for <linux-clk@vger.kernel.org>; Fri, 2 Jan 2026 11:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIO0EifCFwMkzSgGMHO+rCSEYMs7exKLpIp2wnkEVM0=; b=dHefxxywzlSevP0J
	7eFgtmERywp2yfD/gg8h9bG3eYaECvOT+/gAYoD/dkoFUMy2jeme2Ug4LMobT7oH
	xYKjCZTXM+DCtjmQMIb0++ySxvmhQJspuOVjutYvW4kMrMDUGNU4GynicWYcMg0k
	yYlkYPR0mPDHh9IFnsj3wAyfQq4RXA5zKhZXe9jBQB+iNO4e/1VUdIBGjQHbEFcf
	IxCyVNUvHMY1KBuPv1/KtsbWG62++s/U554ZEg2Xgu4ojuiCdZF4WqrDiWtOJwUg
	dS0gU1hFCAPdSPelF0DYjBykmW3Ws2d8zEpFithWVoQMiadx80W/1tIyGMN8J74g
	lVSYcw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6am8h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 11:40:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b1be0fdfe1so509011885a.2
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 03:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767354001; x=1767958801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIO0EifCFwMkzSgGMHO+rCSEYMs7exKLpIp2wnkEVM0=;
        b=BUyJnYnYv2Iqs41hdXB08wR+7jDOXQRL2AOu8bH484UO1lDD47X0PdDpaCo+/VmapX
         CcT8L6CKd+IyPtHPwZ7DyAK16UiE3pTA8OEORRJJGxkrHAEf63i6BSajqz+tLP776rEv
         eTp1xcSaegeniDpFQ9behp0Bi39phPG+QStUiZd0os4QJX0miljqiqH8QbxfTR+iyOoS
         NY0Q+kGHxfa/Hw5KwLlKPEB7jxhcmotVRRapIPky7ceb0aRS3MK/Oondv+LHAREk5jEx
         d0E/vJ5u4AYnbMUL8soZherl/bztLbNLlCWe1BdsTNAJCOEqewvAg3ocWlyE6nJoL1Ce
         8JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354001; x=1767958801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIO0EifCFwMkzSgGMHO+rCSEYMs7exKLpIp2wnkEVM0=;
        b=AqpNYS5Y/pgrhqtLqr1EDMBYZrOsHD/avz77Y8dLUZsNJXJ5461Gel+z3ydlYTmh14
         GmIXUuEqPsZVqEBPoBReTYdPBfCWOf74cwEOYmPe7qn2RyKCk8Tr2BKEqb9L2lZJ4Zow
         XTN6kFpfZQP0yN+5oHl/fXXc4Q87BHnzXKpxBaX4Z8vdPBhMyrFkHc117bWcGYsFBp9m
         m3j2+5ChpnObxzU5hJ4sAOD9vlXffEcsMHb7tKmKoZWA7U6QR1T3vaEdgIva8F33yzYZ
         Q2upZyU/mKZVklvQp2ZqpbGuhcJHO1CLRCxR8LjmfIauaCFEQWWTHgLfV9ZSrZHztzAL
         J7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAPdqe0Vy/NCUlbiWiCE1grul0dprcKSsvGaAGQMiiHl3GVS+bvK3INxRyKpqwhPzC4MlLhcAruo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxETF4oNl8dvToH7D0ZqW9JLi2pCbQ187OSVlAIl5VX7P03DS6z
	bbRLXpkKIw9tcmBEAlytJRV4fNr5xMX9rtenssPWnJ1R4EgUx+mUPiR/LMlmbvjxl4SQQwLG1FZ
	U9GOiKeodueRb0w1X3R2hyVQk61/HuWvX9O9pv1mMUxC81ltLRS1b96D3ZoJ+ItM=
X-Gm-Gg: AY/fxX7tP2pKxRn2e+sZ6VulwSAwS82M8kH7WJH+l9Vla8qmmqY2srqkl9zc4szbgD3
	OR3IEt+tmi1bIVuCWJ3+GKWkJF324bmXEoPQTp0oPIgKKfAlr2dWdllU1u5vh51PEtXco1Av11i
	80udXjmTpO9PMGLO6t8IST6hO7LELgO4a1Dgsh673+WCu4F0l14I5OI6x3Ae1canCMk/8bGK502
	9zhoNq45HYs518ErexgLq6WY03utXiSMGbUSwQBL2VtnjxYRJ6qG3XDdvnBg5EX+wXeOyFgBt6w
	QkTwShACQ0Oe2LMMVSJlKRK7EbMHK0ltLblO4PpZN2KP3z416Eh1CnEz79zS3cP/kBPJanHWubQ
	CYnKIxnwTzISKMk/gGFTaWBTselg6W+zqWQ92fWKLEPLmKp9OFBQqLEerEaW+2Qbc7w==
X-Received: by 2002:a05:622a:4d:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f4abd30b01mr485698701cf.4.1767354001276;
        Fri, 02 Jan 2026 03:40:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqC7FQ6GbGdskiziKH9KoPRNUzbvPPHDM7UoIxaE7VEz2xVwqVZu1iN1rEGBXjnHPl0XojIw==
X-Received: by 2002:a05:622a:4d:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f4abd30b01mr485697951cf.4.1767353999041;
        Fri, 02 Jan 2026 03:39:59 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8350268f86sm2242554966b.16.2026.01.02.03.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 03:39:58 -0800 (PST)
Message-ID: <500313f1-51fd-450e-877e-e4626b7652bc@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 12:39:55 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
 <a42f963f-a869-4789-a353-e574ba22eca8@oss.qualcomm.com>
 <edca97aa-429e-4a6b-95a0-2a6dfe510ef2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <edca97aa-429e-4a6b-95a0-2a6dfe510ef2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OYLNmszKPcR0_n-JrQbsAnyLHowb_nys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEwMiBTYWx0ZWRfX+/SjxdkqimzO
 NwLaDct+n5WoGzv23hGWZmX2GZaJvm4tVQ6+F7jVmZNoLVe5zdr6lbkG79O88L0SFlzuKRG1lBp
 enW8GUjoVIZ2UybJPASdWcmPOe9psY8FqY1BTyhbc7iL1Rpc1dJBJlJb2/hglJAvNMxuPLg2+oE
 G9XxBCFfW5KC5mrrEm+O0t581JXMoaz92YM9GqXvopGRMqMgKVURpRAL5styhkPxUc9/VOTOxuB
 YlorXG8t86FOvT5rJYTc+tOsdMnrK5jL49bOC6ioVCqq/kDJya+xv6ZZ2KJzhB0kOwjNbhHtmZA
 +3tmpeM+GO2t6BKlEmCUvB2eW/2gPf/hqeq5675TPFsI/1kH76zGRGwGxLAi/UZv3Yi8P8mOFco
 hUboFx86oeaws3ldfgusGFcSePm0CFLBIrCYjGtR++Puh/CgfUGdo4clgfsNQd9bCzEYK1DVcdx
 0oQrVghRVAzqgDXVqaA==
X-Proofpoint-GUID: OYLNmszKPcR0_n-JrQbsAnyLHowb_nys
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=6957ae92 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7LOYavHzeLgoFMqDmi4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020102

On 1/2/26 12:36 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 1/2/2026 5:04 PM, Konrad Dybcio wrote:
>> On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
>>> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
>>> can happen during scenarios such as system suspend and breaks the resume
>>> of PCIe controllers from suspend.
>> Isn't turning the GDSCs off what we want though? At least during system
>> suspend?
> If we are keeping link in D3cold it makes sense, but currently we are not keeping in D3cold
> so we don't expect them to get off.

Since we seem to be tackling that in parallel, it seems to make sense
that adding a mechanism to let the PCIe driver select "on" vs "ret" vs
"off" could be useful for us

FWIW I recall I could turn off the GDSCs on at least makena with the old
suspend patches and the controllers would come back to life afterwards

Konrad
