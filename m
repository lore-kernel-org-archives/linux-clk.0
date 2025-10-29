Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DD127472
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 07:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761724232; cv=none; b=FcDQdedABhQ1Q7/wCBFwSn3eoLNp9RctgTZF8Lo8DrdC4fT7aiOdXFny8X8iNsmeQvvF/q3sMpRmcLvlF5OR293FC91gjyUy50vHUeMrhWJYnx7lgdhjFdfXacJf3gntQtXmt8Db0yoeIYWW3XAXp2SPZrqxSUVGpPOonqg0UNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761724232; c=relaxed/simple;
	bh=T/IbTI5xaD9PcdWfELicZ2QYQ5TvNueDbfPT51973gE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RG6HSLVCyvBdvCh/6RgKrS7OW07AZYGM0hcKKTprsNrFmKu1KTfsbU2iDXteapwkFTObsXzXUzcyPqhea15zXCi6a4z3T5/QfmG/9gg91In/7IVGIEl7VQfyo489oeEx3EfufxBUMo9koDJ8lMnIDWnTFvzvXY58Y3imqorAf/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fx5C89Rc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5dZaeXN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fx5C89Rc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5dZaeXN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4ux4N3663627
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 07:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZMJkUQVenyXNnUkuqWmmaeKqgMWhQaaisg9JMWnK+po=; b=Fx5C89RcoAhlSpe1
	TvnMBdcM/2wlXMR6UgSU34H6nzG73SZD44NMoemscVnvrgufIXby/VxyGKyFw8Pc
	Hn3BhTlYli7WAjahBP2Rd0FQX23uOGOnZIOPf3L1iraT/IuuebxafT7WwS9th/wA
	raFTFTF4F3QVCAHvZ3fwI5d6sAkcJbUyx6sQTmXNIofoh0O1Td/vMjbRENRyCM+R
	fUxCmxB0gAZ7Xfqzlc5PqSzFwJuVEHUVLIrt1ymIh9PutwmlaEVCqw6X8K4H1MyX
	nNhNB2HHH/hfx7vQHtw16WccW2rJcGClhyZYZl7DjGTuUAuxwpop0liFnuh4hYZx
	iFqI/g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1snca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 07:50:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7900f597d08so5338729b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 00:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761724229; x=1762329029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZMJkUQVenyXNnUkuqWmmaeKqgMWhQaaisg9JMWnK+po=;
        b=O5dZaeXNtpZ5ReuXi9YlNyKYqGYuvjIrpniPSisI+xG+wPiKJrEjSHBP5ycOls9j2w
         tli10msM6Rg4rnzjvMrxlsLOGZIw9uMr8daid+Gha4IvlNWDos3+Owv12J2D4dp9PaCN
         hajKj8pxBzt0J7XCO9L3/E5QHGYdC/6+hKtf8eNEnxCh9nXWDKJIb9L60IlZzZ0c3RhK
         seHxR2RqacZoPoT8MSrIUwVDP+TU6heBEp8mb3yYqL1V1UEQhGtyvQ9RW3ygXntehZjy
         vKm0VyqHcp22Fd9ddJX2HXzW4sh+i15mb9fYTgaFuqDfTMdayukp8+rxZSB3ww00BKIc
         n4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761724229; x=1762329029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMJkUQVenyXNnUkuqWmmaeKqgMWhQaaisg9JMWnK+po=;
        b=gGHZrvfu8h6TD3nv0v1Fmk2JUp5Zh8FV4B+DWUO99Ct5h4zZcMKLP9JoIG+0wrizOL
         m2Vn6k640ZSS67CIHxjhk5842cz+6P+IkwkDUs8mwkn4p1wPj+TSs3Sh2ocNNl0j9bJE
         YgBap6NFPo1dKi3uYVsvVWXuUmTdeq/rXm/XWu0kIhVYIdNtt4OTXzs1toyYSQ+ulZ5/
         C08+ix9Ej2x6Hzl3bx38f3SIoQTucZ8Zi29yY6gGDtC+Ow2h8o8rhGlL1+Hc7TYxaeVr
         7sUq0SwpiWovw2/RFkXxINy29+/+XCfV7v7pB5fsOu+/BOpUu2p4UUmEMZ5Ny5xVRtj3
         BXyg==
X-Forwarded-Encrypted: i=1; AJvYcCXsBueVra1Rm6ayrSiDh4E5OiR89TrcvGW7PudSZYVKgjtiFgORE/vsLQOCcRu+IroHHh/0zTrAN3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6WBG9ejVmKKf9jIa5MlG1p9vm/j1oqkti5gZsMjgvu4hVkXQh
	xkgPkFei2QJiZnbO9qN1ls4TZvsoyP9C8DwFepSJlQZ8omFCKPBZB95/XvJXRcjV7zQpJI812zI
	iRONj3HcW9QuEHu8IflVwqnjc0aOxjoLLqiHkg4pN9VEbVp9+wbMkijJGJK+S3S7hMCcXO3I=
X-Gm-Gg: ASbGncswSPe+3dSPWFuSWYmsDtv1/wQJwrnnn/MRe3HPQFvkJW7M8RCg3l1yaR8MUhb
	cOL7rMbhFeKxL7t8JjOYwK3nvTWeG/vyxv22QJ7MpMRg9u6iP4zoL3vmk0Zw8iUpt6+cYmmHaqE
	DEbsguQSgmji89wCZQgjGgy6RSEIJHD8wFtUrb1c8QDvzK0rkTyCsppO303Ko76ZmRfS705Q4S2
	n1PZoLBlcpSOIO9kuv5N0RPw7HgksVbjAMj2gD6U0WX+g+AUmdneqfKWPx+6//p8oSh1hK6snYe
	6Jhrx0Q25T3KdSG8wGJRbmTPijOem7Tlcz5hqVHqH3sy0BLVEJnu/fk5cETn97CWQQGcLrFewqu
	XXE8T0slRlEC5VOfjagjiDYYogyM=
X-Received: by 2002:a05:6a20:3ca7:b0:344:97a7:8c60 with SMTP id adf61e73a8af0-34651b39327mr2433031637.17.1761724229265;
        Wed, 29 Oct 2025 00:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrtX2riqRKQJAZwIzKrPyRlcgkmBoKxT4ObGka+kUyMH1rsu0UzCrQL9V1E6sN1ckaqk1v/g==
X-Received: by 2002:a05:6a20:3ca7:b0:344:97a7:8c60 with SMTP id adf61e73a8af0-34651b39327mr2432990637.17.1761724228717;
        Wed, 29 Oct 2025 00:50:28 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7127a09a8csm13143456a12.11.2025.10.29.00.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 00:50:28 -0700 (PDT)
Message-ID: <39b962a4-f890-4b59-a2ec-f1f749ed212f@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 13:20:23 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com>
 <5e8397c3-5bb6-41e6-ac35-4090b7a9fe98@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <5e8397c3-5bb6-41e6-ac35-4090b7a9fe98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Soc2T53rnAu5dPSdu8TYvehfHPaqVneO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1NiBTYWx0ZWRfX3xkZXxXpXJ1y
 87BghWm+LPFGWYtR7SNeS2kLty7j9Epzr4Ez+em/c/WbpiY9HYlXX6FlN1dDG1cs+qZjod41QKg
 jR7WjCt57RzbRVnkbxnwxYoTJg6dDQwOma7w+HrjfppFcsq3oyD3bOFr27EqdK3MHSVM/tYe7Ah
 CRqZt7gf97GdoIn/G+TOcYgrwh1yQW0ZgLDUO9RrBQlCBz5V8+Lko3jDIVtbJL7tcerL3aDbbix
 3gkC3XGnUlK/YOxFRPqHn9c4JohNQrPU38GWAl7FqhQ0Pu/ch7/sI3AbM7GiViFNA0dF1+QbPwF
 4cCh0IdYdYEaB02v1YyI5cwgLkF5U4gKx8bzxpANRebJ+Z9tzwxbWNWNO/tghR6U/e4cR/L0pRW
 POaBcrmuSHnj9sp+lAPxzCQA98wWWA==
X-Proofpoint-ORIG-GUID: Soc2T53rnAu5dPSdu8TYvehfHPaqVneO
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=6901c746 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=41bDykYUuDK7XwA9TSwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290056



On 10/24/2025 1:08 PM, Konrad Dybcio wrote:
> On 10/24/25 7:18 AM, Taniya Das wrote:
>> Fix "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
>> boot. This happens due to the floor_ops tries to update the rcg
>> configuration even if the clock is not enabled.
>> The shared_floor_ops ensures that the RCG is safely parked and the new
>> parent configuration is cached in the parked_cfg when the clock is off.
>>
>> Ensure to use the ops for the other SDCC clock instances as well.
>>
>> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
> 
> :(
> 
> The subject also needs to be 'gcc': -> 'gcc-qcs615:'
> 

:( my bad. Sure, I will update the subject as well.


-- 
Thanks,
Taniya Das

