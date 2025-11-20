Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F932DE6EF
	for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 09:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630356; cv=none; b=jTSaJpWTuaAZ9pREN8EwRJiz1Oqy42+OguGjAXtFyvePJ5R9CggQuvSDuDfowg0bg2xejUnJmOgXw7NVVL/toWVQ6DuOlDbmihmMuixzAkrog2YFVaDqwkZtbv8iW/h5QUdEjWIij/eR1mmbzqdkZSaC4jUlrgnr2LJjaEd03RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630356; c=relaxed/simple;
	bh=UyX7+WnSlzwBD6fwru2796ZZzakiwq2UBqLBXE0aHl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFwS653BibTecwKVtjjaLZgkbxBJHON1rOTZpXst/No5/Z5GkoDHKxIJ4NPBcqYpnDVqhSjeTBV2RGT2+Ss/fTDbiQEI4sWXiGM68ZsQe5V5HGNaItGewrihvC2Inb4Q4cKg31k8q4SIMgdK5pZfZR4CdlvkNNALMlytWUvfV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1ieVbFd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEFVSxVE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1ieVbFd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEFVSxVE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK56OAY4026174
	for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 09:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Jw7pqmsMMCuaf957Yn9KOXuQXh/kimrXDX+aOG5htU=; b=F1ieVbFdXsRbbAga
	odZaQChkmIjgOcqggekmcTgMjMXAiL574gFiLKDanvaywrw/ANXz5d6Lo2zr3iz1
	zsStdXeAoNzC+KsCsjI28ohXkdwBSa5NXUyJXF1+9xoq9jpLp2u12GqJx8x1ndXc
	QlBmoJTCo7NUU74onJshVxAa1NbjS2x1JrYPemnCMpq6W39IVM7RhXa/m2Q53GPv
	Cb1ZeQpX7VACRLRL7Gy6ExTpWmHK6ZVQXjzGMgw2nQjz1qMukBgBrrtdIibylfMC
	yTgy4nFvq1aORIZIKYguEDEKRQ95Vsp6PPNOf9RAujlnPnuSaWfNm0AXnhQzUJJo
	cnNusA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahvj3gqbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 09:19:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6a906c52so1618041cf.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 01:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763630353; x=1764235153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Jw7pqmsMMCuaf957Yn9KOXuQXh/kimrXDX+aOG5htU=;
        b=kEFVSxVE2C4fsE+FeXZs6LGYZfh0JsTp4SK3G/dHPnjxhcWT1ZJcqlMBvtw35NveKc
         jXdvYyYo6Ta6bwHaFHNgbYQVTcMF0Kx6Hcqm/D98a4NLeOTtg4D4RC1WEf3sdHxR4m1d
         raRzzvwBlRtAfZnEdkJWjnCg/Lbyt6QicwJzsbL7WfLpvN0Gj9EYPqgrMi1OnOiI3gnF
         k1E6pu1wDXFfu7t9gFuSsW/XtU2QLOFaJxf6JRb6dsHqrlqCcais7ddlI2Xzx5wLpnZC
         8g7Tk6x0fGmE78uYA65v/me+v8jiCUTUokb/Nm9IdUZQ+oDFdFY30GOV279KZLtXaHw/
         t/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630353; x=1764235153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Jw7pqmsMMCuaf957Yn9KOXuQXh/kimrXDX+aOG5htU=;
        b=igCrNUfoiyq8Q3sIwG9To8PmlHq07W7BrJybslMs0LmsGi2epwPZN71MNnJsetkEPl
         5x/M+DJMxPdDrttL/OOU+SEo6GSlNSa+Fu+DE8n+bMfPxYJNf1becD4vYK8prE72RBHa
         /8bjH+NPsNUNTU31xsu02V7vbASdrwVmj/Ys2BvoOtV0Llh9sS1t6EpxpUthPfZZUuvx
         ygiOJ8zwU4bRYh3TX0cvQtj/1/UwBR++SMwwd9HitkS//shQPjpGICozJxge3Tcc5sF6
         T7iNr4Qm4N8h1Hi5DKj1lxlQZoll09Lpvo98rrZMUfOfhONKmfp1L56u+OjuEn1Cms3E
         6BoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOEuBZl4IWx3BQV6Drd5aS8oWA6SW4cuDyG6us2R1EP2Ttc9PqZe7bGuaV+1oQbRMuvUNOrAz4KZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hAfHy3jQjn5SHDk0z7RhvA9uFbTGc/sAub86FszHvnH4mHs+
	3PovytaXj1guMpyFSqzHBaFAwg43KHfOHkOy5PksSB8C7TLgJcjXG+ZMFJLClm/F27SJ0EPTnqG
	u+ExBVJnEX6s/aIPcNgTLO/SNcdGoAKjICub0OlrfLjUkaI66Fk5KIwCxMiEi9C4=
X-Gm-Gg: ASbGnctz6oLP8IsOpmThdN6VRCG1ml3+UaBBy9JRlZw7IYheorb4lgHqtI/3zF9e2Hr
	G9pnqyIfJAtuwLvk49QFqGXTMlJpg1fdvWVcx5pSqzBc0lRri93gtEedSZ1iVogfza3tD10tiGJ
	ffrNRdZFJ6ilTAAkPp7Pw/E6l1Wc7Rl5goirH9L0neCII/0mWp1TO8vg1CgODiFHnMHhejqh3j3
	H7kYoqiUDEMhyjwEjWvC25rxbyNRJEnbQYJIK7lFcBKkjCwAimQ5LUHAd38yR6rmd1urkv7nN2e
	LIhra4+ad6IRkTRuJnTiH5kTP/k4Aq7Gw5gkhKFw/LTwgcq2B/CbLwtOClCXV475ECwd8lmgcfy
	ueVv4/tBGORR3fI4z1ZiMvdAx5G94mVlUmyKSxljo3mKKMPipO8gugvSPJOAJoH4QyZ8=
X-Received: by 2002:a05:622a:199a:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee4949c9cbmr20965041cf.5.1763630352815;
        Thu, 20 Nov 2025 01:19:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXSpqdI2wMetO3hFEXX9ez/5oxr0gnpZj3ElAiNw6gp7oyMrtGOdyujf7/H5/PzN+wmgouYg==
X-Received: by 2002:a05:622a:199a:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee4949c9cbmr20964901cf.5.1763630352373;
        Thu, 20 Nov 2025 01:19:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459e61sm1636749a12.32.2025.11.20.01.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:19:11 -0800 (PST)
Message-ID: <2f18ba6b-ff82-4c6f-8a6d-154886dafd48@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:19:09 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Use BRANCH_HALT_DELAY for UFS
 PHY symbol
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251119-gcc_ufs_phy_clk_branch_delay-v1-1-292c3e40b8c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251119-gcc_ufs_phy_clk_branch_delay-v1-1-292c3e40b8c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J8WnLQnS c=1 sm=1 tr=0 ts=691edd11 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZwrQQgbAbSsAXhscLloA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xxOYpG3GU6FlHWMKRLF9bGF-w6AMtkaK
X-Proofpoint-ORIG-GUID: xxOYpG3GU6FlHWMKRLF9bGF-w6AMtkaK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1NSBTYWx0ZWRfX3nC76cpOifK/
 qQGlp3tC4b+Qm6sq/mUnTVoqNv7Md2y4nufxJ5Y25haRhPkd6u5CANAa0zRPEbG/5Cj3vG2q8HL
 hUpzwGJDkmPGbCoon2oBAGXPJzCDsi9mvXPC7gnNELTMnZ9C1EPbG1pC7XviwOpWHv2xGZZROb7
 QFlndXZjQQhi0kvswTMPFlgfsWbH+GXECGZ7PlSZLZ8PsQNDGe7JPwA4dMgHgHVj0BNHu0zWSQA
 8inRAYIDhqwuhLQthsdhCSBoj5P5WZDwUms40UQyMMab4eb+cHEZeoV7Oy9KDbRIECNUBMsGo50
 ReFdw4GxafVUtx4OfWMTyISJbcfewGnComMKEuK5STA8OvOK9Rk4JsHWJC/GRkxFHgukQLc678O
 n8KSWeJoUttaijqrNQttLjmh9P+eeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200055

On 11/19/25 6:53 PM, Taniya Das wrote:
> Switch the halt_check method from BRANCH_HALT to BRANCH_HALT_DELAY for
> gcc_ufs_phy_rx_symbol_0_clk, gcc_ufs_phy_rx_symbol_1_clk, and
> gcc_ufs_phy_tx_symbol_0_clk. These clocks are externally sourced and do
> not require polling for halt status.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
