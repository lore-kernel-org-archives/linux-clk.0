Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEB138C433
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 06:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195300; cv=none; b=azq6DBDwbU1JDo0/s5JiE43AQXRRx3rkIQBq9HTXsPlkjxO5t5TmnVRD434/gXjflhg/sgflkfdz5mXF1NKMjV0+AwZU1rGZY1hm6eLiLYZhfbJ6jYj/oDDyJ+W94y466yGA0pUPcKrzEYlGrw9o4iu5dAt9rnRwAsjQU+8uXhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195300; c=relaxed/simple;
	bh=MyO9vSxYmW96gkicKMfQpYP2sU8NYxAm2f3g9BjPzFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ea3ejVDlXV51gI7ct5sCNI4GzAQqBXvfrthXlBK1R/w87RQ9/6V3+rjinMj4FEyaGPy5ZyRBC4goO3ECunBK6/8v6T9S8ZpQRW3NTSCJueZ+DZc/048EETxbRrsdWnGRaO0GyqlAcm6HlG0MDY2woctBLqlmpeGjuMvXYJHLbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdHGanCq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hn/juwvn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdHGanCq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hn/juwvn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N0lcL12788112
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 06:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRmFezgGdNXaD4cxRDkq5/2uzdaGtG1vf2sMTlaxZt4=; b=BdHGanCq/fvjWyLx
	lO6xyNjBVc9KBvnM97L9TUbDYCAPOOL0DDuBny+lP08yJS19RkAtX583JoZPDe4n
	2hLR7qPVS7Vw8tW7ebDheHxnY18S9pvPsI/7VK2V76GOJHSQk9YHBEf69/x94lbL
	KxBU8ewuJzxi/dNl9trrmdjr84XyAYwsi1fJqT7eRUneFExZGw6OHjAnluDkZyhV
	/Jv+dX8ffzdhNuIgKUsXr4lcu9Z+Wa6Poo0CP1FsIN0jp3qaQ4GY5U4WAFxeWgR6
	H8hRmzyPn0Avk/XPXtwX918jSIpo7BjBdOFsiYxMFBVnIIf5NcJ1nhg7rsP/zrGY
	P05+fg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n438x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 06:14:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c90101fb3deso473377a12.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 23:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782195297; x=1782800097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRmFezgGdNXaD4cxRDkq5/2uzdaGtG1vf2sMTlaxZt4=;
        b=Hn/juwvnhaXiYHtO0V16zDnM3+QxkPzD/vRX9PYQm78gSz2D5SvXz6df/ZFFW2eMmQ
         3bHYfOXsF4q7Vh0DRW6hkBRISuXgwqvUIoTpDVBelnZLdmo5NVbcD4ODdMu4CFjGFqoW
         jMO46EKUa5SgEvI8FMrt6PC+WD2eECfMIGKbEdr2xf1s2GOX70uyJw9y08AJPSUKycuy
         NTPZYwWj/x2nlua7SK7Tfc7S6cGuB2NUG2qmbh2tKccvDTKVcJuvtB+oXJcXHGxmGmQM
         W20e9RdcU61D49DFd6ZTmpy54NSwM5HwDxJTm89AmI2YxslzTMSHp9ggTH4/dZf552Mx
         BnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782195297; x=1782800097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRmFezgGdNXaD4cxRDkq5/2uzdaGtG1vf2sMTlaxZt4=;
        b=Qr+42vmWUx2PAtfbz6SNKjzXKUWqnrbGoYkbBC8wzHC4ur2A1oLq3zhRs2c0E1ougo
         5PfP06yVkHM5aUaMmBpfJEH22odSH/YQCpetxEK+uZD36hWPrxZFGbfvU2rWlREUJkFb
         hse3e+rIVSo53raIb7kpUWcWzSCNRpVTm90YA3M8V0Yj5lpd/JcuKe+eFXKZRWw1WIKS
         idtzEXjSh9Kg0J4xbqAUsTpLVyi/gp+MXGzyYntcR1CsPD/EARgl51eG4zTNbbZlE/rT
         TTUrCvGXcYwF34ZWWkSnNTVsWMPdrKjNCJQKpt4DHFsY8ZqPSwclTEcVMDuYMM4go1k9
         jWMw==
X-Forwarded-Encrypted: i=1; AFNElJ8+DtrhMmfN7UQaDB+RTStnWGH9OAqU4O6pAZn0h5tL7K2M6oEx8byF8hFA/3dNvlLImBmtWGPekkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8NT/2cKA17LRnvBd+qWOL2zBb6Oc2q5/jXLz4uuhiwuJ+9vWX
	ebgJ18gOX4EmvOWfvKX1H9RXo5IkYARPBUj0P2Kmzzxx8rEX1dxc09O3tK3Nj3iAU5XqprEUB6w
	ei/BT4zNRK8227PagCsNE88xZRNK65wkkdgWSbo4pAGAUaZJNQS5b2KLpBk477eA=
X-Gm-Gg: AfdE7cnvMkMs+GfREP0nZdcmL2cecI/Xz/OSsriHWR3399KWkr1eOoBXNCTV07KHfkt
	h/NdCh9bvrwx4OcJ9m9a9/iA7c78PsA4R8oqy3u3wF5or8ztW5+euCpMWx3dRfLPufGfrNwxS0K
	9Q0GytvbXkprXWfjNbN/ZPghZiwG0rCKcarOC2cnkDUiFdfcXm8MXeXTtsUqwygzL+GwxKbkCxd
	UJNvFQhWCiVKLrYK+M/vq0J574BHGXlaCtRRz8o74f1EhZOoSlYqQ/t5m4OqwFq6xkvEnwDmIm9
	/43gN2Hq45Qs09/T7cFzstqu9x4u0o4n2P01PAJk4H+RBQyvcQ38j05NIBqHFzd5aLtJIED7Dgc
	DtaUWnv0A6nSxXpaqpQjz5JnfgicZ8QPGc5RuBg==
X-Received: by 2002:a05:6300:14d:b0:3b9:545d:bff3 with SMTP id adf61e73a8af0-3bd1904cf62mr1456535637.14.1782195296935;
        Mon, 22 Jun 2026 23:14:56 -0700 (PDT)
X-Received: by 2002:a05:6300:14d:b0:3b9:545d:bff3 with SMTP id adf61e73a8af0-3bd1904cf62mr1456492637.14.1782195296513;
        Mon, 22 Jun 2026 23:14:56 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc2c8f0a7sm9216353a12.7.2026.06.22.23.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 23:14:55 -0700 (PDT)
Message-ID: <d35fb519-ea1b-426c-be97-d48201eb3bba@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:44:35 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/13] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-1-8204f1029311@oss.qualcomm.com>
 <w2y2wz3cbifnko3td3ovxfom26lll3vl5qgulksa7qnuvzukpf@pqlrh23sljsz>
 <f6264995-a6f6-498f-9557-723c39becf1a@oss.qualcomm.com>
 <CAO9ioeUtpSoorLUHXXLEjS+N_AWUtdX2ZD0X+Wss6O0+gwq55g@mail.gmail.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUtpSoorLUHXXLEjS+N_AWUtdX2ZD0X+Wss6O0+gwq55g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA0OCBTYWx0ZWRfXzBU/7Addznb6
 1C5RRYuopO7zLLYUt3lTdB4pxNzxvR+UwQJjMpU5HVCcTbd9Ym1wEIiHysR+BDfoBL8oqJ/3Oka
 pUKLDR2EtNIf0qlVaxxCbU5JDieNxSw=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a2462 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Z54PLgYRQ6qQMJT4v0UA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: SlUzlAE2y5ConnZSlwJRXOvz-X_u4P0W
X-Proofpoint-GUID: SlUzlAE2y5ConnZSlwJRXOvz-X_u4P0W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA0OCBTYWx0ZWRfX9JAIBZPgGnma
 7JSAWRYZ2V0+LTlB36nZ0woatEoiFt/w1aPH8P3c4TQwdqLrKrTvkoWme3I+jI8oGQFCeP+UQkC
 yk92JfBxrmiFwNS03zf+ijdEHez+Y/MpxH9WNginOQPySHPuKwfdRpIyt2fCm4vh5hdo1nqx3fQ
 MhdyE3lKEyqYkr8PhSUhp+brbHna+GYNPoCc9sDCxjme1fg0db5i40K3MhaTpgclBoWCCutLPvk
 QDiyFqjt+ErHuE/hNDlEFkBSc3Ea31hVX7kRTK5sQtpv79Df5qUS7UvviMtLclfzUY3zr1ziApV
 t4ZC8q11Egondpf+ar54Cgekn4tLSdsgDBcpnz4yTZnBsxvrXoEzj7U2TfLOLDjR7Re/4AIjt6R
 L4Lg4bIrGDLrJ53Rxq19zO462+8yllXqr0qZU2CnSBQk3lVfgc1ufaX5083rM3TAO/3mKvQS17j
 XyONXyn+qkkaPPPmJTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230048



On 22-06-2026 08:42 pm, Dmitry Baryshkov wrote:
> On Sun, 21 Jun 2026 at 16:28, Imran Shaik <imran.shaik@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 06-06-2026 04:54 pm, Dmitry Baryshkov wrote:
>>> On Thu, Jun 04, 2026 at 10:56:07AM +0530, Imran Shaik wrote:
>>>> Some GCC branch clocks are required to be kept always-on due to the
>>>> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
>>>> clocks and use the latest .clk_cbcr convention to keep them enabled from
>>>> probe.
>>>
>>> You got the feedback, but it got ignored. There is no explanation about
>>> gcc_gpu_iref_clk and several other clocks becoming always on.
>>>
>>
>> Apologies for the late reply.
>>
>> I have updated generically that few clocks are required to be kept ON
>> due to the hardware requirements. For gcc_gpu_iref_clk clock the
>> Power-On-Reset value is default ON, and such clocks are kept ON from
>> probe. As Agatti is working functionally, I will keep this clock
>> modelling same as before.
>>
>> And I will update commit text that the GCC video ahb/xo clocks are
>> required to be kept ON similar to other camera/disp ahb/xo clocks.
> 
> Why? What is _wrong_ with thow they are modelled now?
> 

Usually this is required for the register access, hence we mark them 
critical and keep them ON. As it is working on Agatti with the 
modelling, will keep them as is for now.

Thanks,
Imran
