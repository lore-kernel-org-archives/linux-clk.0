Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097A39478B
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776333276; cv=none; b=ndGV2RmTEUm3RQHAH1Yv78CgrpnSY17fz4xawvcY1DKe3F5GBDqqZAJq7Ji45COk2iBGOoNxWVBeqXzsRGBZ/9fTQgBr+0GRP02sJ21PzY/IdQ4Rn71qkdsPwYnkGnomEnvT5NZnRi5mZX5wZdh6NotA5j6IMFUgWlb4V2djq0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776333276; c=relaxed/simple;
	bh=UIXp/sGXuLKRINEvgyEHx7Gzfpv6ZaJ1YnMeey6+Hz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjiF/otZVjI0eBtIOQKl8vfRajxuAYElQU5QkWmmigkiDm+ev1aLlFsfoxUlAiiI6J0CWqTx2xNu+gCpHR6oiAwNvL2tRXq+FIE+pbcQ3QtfyfNGThetl6dAVB4VO/u1atdbpRj2CgmdLvhLKr/m7bBmZKRsJ2kCu8/UIfN2T6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMLlm0sP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vt1XosU1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMLlm0sP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vt1XosU1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8IOdu2834783
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 09:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yj+iHxWDrDsRq/G9HxBXeSleV0agIVGconl71ZCcul4=; b=bMLlm0sPF3Xf5EJw
	0zmffa5AxDTQ6BMQu0NptUkSXA8IBU1kwUpTiHi2l7Kr5u4JMjo/znlBAnTzG8AJ
	o07x2uqXw2EVig+e2uhU9+d8V/4/ZcG6lzHbLVVTXg4W4kCBjVOtuHmmpoOEhjbS
	LbGOgBVuskYHcAsyifAmTxR53eleoua08AxJASv1qxHqmGDhcsTlh6cAW6Y8eG9p
	GZEYdxsFoa/MhmYNEHz0GIi0LUPaiF+XbGk13EFBe9lQ4HFYNat6/Gh7xmqPQsDi
	RT1B1bcFLq19NF2pgK9U7Rv/mUMPN6YsUG9scrOITtXAjOqIR8L++MDee0NC+9hX
	M/INQw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcsvkct0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 09:54:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b454cac322so44519645ad.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 02:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776333274; x=1776938074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yj+iHxWDrDsRq/G9HxBXeSleV0agIVGconl71ZCcul4=;
        b=Vt1XosU12SCLp8MbC49qs904R/TEHXtZEWZ50Lj3CyR+g712TXzSX1TNu1YM7hDZUq
         O08kzdkvDUL0zsn+tnp+wpaVZMUORdMJdO8YjeDfL2yZ7ZjyeHJsdtLh+cjwYfj4ra1t
         frkQ9gGK6QvNULsETY96aTk9xPc0/2JR2x5VEDzeo0q0V/Vczg9EE/RAlQmzBx3gQCQI
         v/4Cv2kNAENKicWZhvblW54THQ10UN0SzfRIlH/gLchRpZw1+eywDGtxxlt4H4A1CGFb
         pbj2gU1+qVpoeGO2WfyTAACkeWC90QeCBDqytxR6V/e6zaNY3eAo2DyBvrH1K4z1b3AW
         YCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776333274; x=1776938074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yj+iHxWDrDsRq/G9HxBXeSleV0agIVGconl71ZCcul4=;
        b=dseRMJ56mDhwFSisZyTkEKdyrdf0MJyhpU05twkegOJlQmRrKsnXOa+Q/kh/56PS6u
         IW0+nzoSLbKRA2v4q1nfza9INn6TJFoCLWDEa1s41GmvnxwvPMD+IKGnobv8b2h40BuR
         F2L+nvUwl49P7PNUuOATMLw4emNkEjpO1jK9KCNrcMEPNz6bgMyvcQvKUTvF/FSWGPYH
         JuX3a/7zZw+URDASBkMpRCrqbUkqHlB4JPksFzFcJso29q0qI7cntXqqUwXDffUqZSuO
         JBHJXsImuFoClF6IFNxSkoria63hr4oFcFOLidGLLt3xV19HIxwnWBun1+g1y/G7L8iH
         GL4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/LRJpDLXvApXMZRP19qtEcd3rtrE2F10b0RWgY6G+F/wcUP45C+CA11Ir+G1WWinjCRrix5CMj9Kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTtFMBZ8oXtfQ2GkjjIYyH0gfTqz8GpZcjF7cb6KbKYe1fRiX0
	w3075NkNAvnbM2e9GXDnzXXoKKl0B1dbX1cEfAsMdR5geGLVdBOExLRFnbGoN2iO8EkjseGeHkr
	k/BKJq7YChCYM5EhDuPsQPRZ+gzJ1Cmbh7VGedV4uGXDoazqvwrTljaawSBdl5vO0gSiKi/8=
X-Gm-Gg: AeBDievxuPaEuyN+D5lEgRpKxnmcXPHYqtX5c/66h/bB1UFPOZhVwW7y6hhhXPiJx6Y
	FYZEoW6isIG/RIGN7zF60RUNqh53jng/n30viJWd9jaGA4oche6ltHR5HR+6zkw3dHdVVvF6LJv
	y0SbpmWcL1SwQRBW5GrwtGe3K7HAXPTNez9Fhb8t//Q0FcdYT0ikOdz7Mt+VpcFxSA87+EUhm/M
	jm/pzG5bF1e8i8g0+DgSkyB9Ky5HD83pD4BgOPAmKy8hDZNBUIjHzL1jcnkvlPY8yVi3fA10Iir
	ylR+lD8oO6W/nJHM7K+f/yfzRIdVe1SRP9a/gjxNFchSzgAeSJMkUjYjQOw7+kpakyuRK/huc0j
	Hl10rCXJfIcNd7z6tyYtchWEJkjpjh2VmHLnzZrW7l+68fI6GV8RXCMzYMHz8ABwX/A==
X-Received: by 2002:a17:903:3c44:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2b2ec46e10fmr182420285ad.31.1776333274305;
        Thu, 16 Apr 2026 02:54:34 -0700 (PDT)
X-Received: by 2002:a17:903:3c44:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2b2ec46e10fmr182420065ad.31.1776333273837;
        Thu, 16 Apr 2026 02:54:33 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b47826e23dsm60434955ad.39.2026.04.16.02.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 02:54:33 -0700 (PDT)
Message-ID: <6928a3ed-00ac-4e86-b5c9-c3b27f3027e2@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:24:27 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
 <20260416-khaki-goose-of-will-ec76bf@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260416-khaki-goose-of-will-ec76bf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YBpHZx1l9t9UctpKIuo1N1nmjA768Avg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5MiBTYWx0ZWRfX7gCuIQ5HLvPG
 SNH/tDEY/Rd07LBP14eUr9PHWm9woiLSFIVXKXEIU57pMaAvJwSv58k7RQB4jG4DSZ0MLDNAcAI
 UZVKIlX+3ACJQKae1vb8lTQ6rtOPRq1R8zU7SXpvxbeN31ZVWXQKdE8Wdmif4I0OKlku/T7EKDs
 EVXpeXQ8w5E9KxMv1waZTq+N64WzRkSkrrWWhfhYId3KCs0p3UlZQ9cXzKc2yZjiU+iHKn3YrH9
 hhDPNKkqXW+w6wJgM7A2t2EhdacBie02gnj2zNYd9l8djgIL6q9WcjYOmw1LydgiYzoxVcD43Aa
 sxj7Lyk0ZsyjAcGDjifdPSFQb527Spl56J8sAfAsSm2pa5XRcknTmQstlMggXjPHuZaTKoY7FLr
 Ban8pyuOT5kBc1Z1zwHD6f6sfxUAMm2tZt7gZoSbuwxxRXyolIzUOieVUe/FaU19npSdm9UGm7G
 RoGuEa3StqpMZfjbXmw==
X-Authority-Analysis: v=2.4 cv=Iby3n2qa c=1 sm=1 tr=0 ts=69e0b1db cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=wHg0G52u6mwEmVL3RUcA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: YBpHZx1l9t9UctpKIuo1N1nmjA768Avg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160092


On 4/16/2026 3:05 PM, Krzysztof Kozlowski wrote:
> On Wed, Apr 15, 2026 at 07:03:19PM +0530, Kathiravan Thirumoorthy wrote:
>> +		xo_board: xo-board-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
>> +	};
>> +
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		CPU0: cpu@0 {
> Labels should be lowercase.

Ack.

>
> Best regards,
> Krzysztof
>
