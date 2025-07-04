Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32CF2D0C98
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629964; cv=none; b=rMiwIxYk5/bsHWmASoiK1J4WiEVDkcwdpxjlZdX5THROeiD00P/7j134OsF5l3CTudUL/ZhbqOG376d74ipImXyuW+znP04dmuTJYZyK7kfcTsl4WrfXxdZQZ/eTat8GFONgcep/E/3xC9jZB4keWZQsJsyjKnSDc/298ZzdX0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629964; c=relaxed/simple;
	bh=Jxr0xdYuj2907vXx/1ixI7Q7uwKRLMkvjPjpU4giaJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7yrTwUY93ej97TVm2btxf5Wr7155KNjILAThlOWcTc4qaO7psvsRz2I04oFxjWqBD0Hujv8E56vyGOhZ8O2vSm3IUDZu3xGYkjCAJNAWNWK6aLnk0NCqVLqofCw/lbvTpBJZ8Fqp1yJW9iudVZAIEvOBAmrd4wiAIw02ue4F4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSIuxwf8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSIuxwf8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648V2fj029559
	for <linux-clk@vger.kernel.org>; Fri, 4 Jul 2025 11:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsXV7drYMwvyEcS2Cgw5YwM718MexIAF6Q1pCCfKGWA=; b=SSIuxwf8cuP8xhT+
	l0vtAkYBHkf3n7wGfnXOBiaKJSpq4JUoyl0S4JDcFbQij/q7xoZO6NiLliDHOOkS
	sg/KeH6Nh12N0w2jLbfDPooI0DITSAGd1ozxtlVEkS3j3NSaHB/recD4Rqz7T4dN
	FZkgsE+nq3t4A+jp5X5kzVnFGjPDEtqscj6gan5pHJrBNIAt7fzcMo1KVRHdIrNe
	Z4uHJQHeyVjvH0u/PnDsnf4fLsxOBG+DEcoA8QXWnMEJ4i2cb5I20otkGodNyXIw
	m6cZKG33XiP6eMZzILpa2BgpsK+8wwYsOLIaJnfHd//1YtkCEBDyXExzaRsYhQ2+
	Wk182w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s57vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 11:52:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a43be59f17so1382011cf.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 04:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751629960; x=1752234760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsXV7drYMwvyEcS2Cgw5YwM718MexIAF6Q1pCCfKGWA=;
        b=VGG0/bg4wczRAo2B7xljKm2Ht+P6oSWzwgq3SMlgJfAlz32jVWRkE25tE+9fGt0Wl5
         xf7R/WTPkdmXSmMB1oYDehDJdJDBCy2lxcu3hOypv8D+p0vH2xGEMi/poBVQELClivBr
         Wk3kgCB8aOZwHrs3DCvch7fLW9EHpks4rsXC6qTemlU0jDqPY9pS56e+FwHwIAHwVQyH
         EZTnpTU986iWZlW6zzY06Jlsjlkrchh/IeT0X6nhPkFrz9iQhc07D2E+FiqL+mEh2axA
         vsLnKdI9hbS+4bAdTBcZh32JaMEET+2AoJ9J1hhT8A5Gle/XeNncOw7Ubxgve/zjrCH5
         Yr8A==
X-Forwarded-Encrypted: i=1; AJvYcCX80wpLYz/DkTacBXMRFSC/mXmxHmQlcBnMg67eZS21IpcSm0UcApUxt7FkI5tZLIWRtCjEriOugkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzofMESw4xcCXUhZ4dpcc4FVF0yQTZmc4NC8SMK9+ER7uv4ZYpV
	DoiV5zy15MIzLtjPFa0XNXch5yp+fiaC6M5T8YEvQA0X2EeiYulI8Bre7VJ23YmPaQdB1cTD8Ep
	ecOife11+O9TiFpub0cpLGiMO/nZWJJiMbUgaMxyWMenPkByUqs0pCYimXurPe+U=
X-Gm-Gg: ASbGncs8ST2RIllIbIZ+ldEuUu2Ts0iWGr/aWqy29kzJuwllFuUL1Ip1OTGmzVHRWv5
	SODrINM6Wh85G9zTjM/612P/1+OSyqkRO/bTCw71TOfntpprL1nwvnSDlBg3ut/xMRm8lQkSF7Y
	OEDbRrovu1qDaVf7QBM/YUe/8XfZeZYLMGcSOMhrOQL+SGTLoj5OGT8KU9G6S0e6Lc2b6SmLH4+
	PbtJg//O3ck3yylmC71xcXgtRadcekcTZAJ41BbxSJ2cT7WLeo8DeIGrwUm9GxDT/CpIFWXwn83
	oTKlIs4yWsq2kN8kWw8rKntNzJEvwjQd9+zo3zvFkFIzWpyZMZ7MYrL4ARSp8iZMmhdgP/+TVuX
	ATytLTg==
X-Received: by 2002:a05:620a:278d:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5ddb5ef03mr114075985a.1.1751629960611;
        Fri, 04 Jul 2025 04:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCSLKywpPAh98geWs3TsZPTeVlJ36KXynK/cQGjD+OqSD4iTSBmU5d4Bk30MBe3jGsdImkDg==
X-Received: by 2002:a05:620a:278d:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5ddb5ef03mr114074685a.1.1751629960186;
        Fri, 04 Jul 2025 04:52:40 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b04d30sm158014266b.133.2025.07.04.04.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:52:39 -0700 (PDT)
Message-ID: <cfa9cd1a-2a5e-4191-b27f-172ba202175f@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:52:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] clk: qcom: Add Camera Clock controller (CAMCC)
 driver for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-5-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-5-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=6867c08a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=lahI4EVxXURej6Z-Ve8A:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfX1B2xwFBw+MyP
 /nMwDULLcr+M5Trn9gAmPu+MXr+5GvdTnDleLCFGYmVmAxbzw5zqOCcugOLkkRnxCeUUJZKMmcD
 +FWbdNXoGvE8aQ5oHPIKRVIDyTX//pX/8yu9CRAA7fzIBonaow3v4TYkOq29QIhUw6vKZxCjIoF
 qoScXX6pvMNEPmaWWlZuuANS70wRuDkSMknWycy1JVi9rZEehKt0xhOoE7mjsDH0A8JsNrMSN8k
 xQ25VqimCPzci3mepwDTtOLuTJniYZ7LCMMAL2bGwvhgf0ODIajB4ExfV3tZfC7VGjiPXWjrInG
 +X5SpGxoZbkpWmJh0nkl0veZWwQPbZyRcXTmOv69lZFXvSWehA11ixKq4hei4n0DDOShNPp6kRY
 Sli42hOw2Xzv38xtcoV4bmmFTdERxnpwPPMSHz7fOMIowtGzLSr1LJsOXG1jcZVzxipzZM+H
X-Proofpoint-GUID: -UPPE7tQRjGHv7P9lZ5dmwc0MooH0HKD
X-Proofpoint-ORIG-GUID: -UPPE7tQRjGHv7P9lZ5dmwc0MooH0HKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=884 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040090



On 04-Jul-25 09:16, Luca Weiss wrote:
> Add support for the camera clock controller found on Milos (e.g. SM7635)
> based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
