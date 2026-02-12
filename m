Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BAC3B1BD
	for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892744; cv=none; b=U/JEs5FkqY6KsOHoUo+rVGtyjkHKdAgj54Ws+sXBBJMbDgJagn6DvJot1z+pXDP54WzIYHra8b/PrgQYxW+oybS95M4Hx2lRVgJPjyjLHMt9enm5ofb0ToPxwjOkyYHpgv41nKw0eX9tWmftepVBGakpoBa6jFd9pw/pGyhcdaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892744; c=relaxed/simple;
	bh=IGF4G7Q16JRMSwrftPl+jgfEScB+RMXUNFnD/kw/6+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhc/I9vQ8D7zs/YRqGVhvL/3BYXKbYfc+XAGJvdgdZyzjH5uQIG9pLJjEODxnFUwDsEzRi12xw76nw7QPZbA+P0w4uT10STCc0AtDsgn9ASQRe6w0Ms2igkGctjlxoamCn3m2r8rsnKLHz0qC84j9arbgzjzroye1FWLKP4S9HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Az+AHIJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgYrrkdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Az+AHIJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgYrrkdt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAIHIm657744
	for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 10:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGF4G7Q16JRMSwrftPl+jgfEScB+RMXUNFnD/kw/6+k=; b=Az+AHIJKIlRRQ2rR
	ztWYSiWW9tXiZ/EKjbpBwuVMlKp2nafgtS3sxrm5tNhli/tT71wcM5JesMsOftfq
	cxWnsWqJE5+y5h6pIGZsYrI1nQb2yvfRbaK+Ue0CR4oGL/LZPER8XrdfFEGZmUsW
	KGplxCj3q+tVdAAd7bPe0UPJdW3U9In1gmv7+h8yXhpQWu5yHk644OIVq7TK9Tsc
	RvSebjz6LIp+g0qMzNYHyxFE+2X/X5ARekcfBtpeLiSxu+d2WCMCb9M6c3Fug8fn
	av5e6yiI18M+1JjZDbtu9o3G4F6sgllILAYWd9NyAqljd382DtLSKaFE4cVlS6OU
	kvh3sQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9d09g256-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 10:39:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89545f12461so18858146d6.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Feb 2026 02:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770892742; x=1771497542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IGF4G7Q16JRMSwrftPl+jgfEScB+RMXUNFnD/kw/6+k=;
        b=ZgYrrkdtVEczq2N4sx/qxpmDJycDdsmLbtfJ84Lc+Liafz2phcX6xdNASot0HAmu0X
         IEDC8KF3Jv30Dz6otRYBYeBDEJT3qxhVuEvhEjxn6GKhtLEJC4RFoemfaPtN4rX4+vmu
         5l8+CimapnWHy/E4CIIwuVvljKzy1Q/RUliBsnhwlASBwFRwZGk/MSnuAksKlU7lZQbU
         pcnmtUBfoRcWjfnGmA1VU+cAGTYDouBI4fpbYpsL/szU7opCe7lpAAiiYMkRyaThIgvz
         pmRwthxOsC8rhttITCZIEgLXwOJ4IT4d31f792TlAWBhxb96Din2laAH1XmEH6FqGNdT
         +39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770892742; x=1771497542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGF4G7Q16JRMSwrftPl+jgfEScB+RMXUNFnD/kw/6+k=;
        b=KO0zHnoq7aOyRVCUobys0YRkte+A6g8vtqu93IFv6MwRVmt2oC6W5nw42V/eFJgVtC
         qGgJ/sRuFbxAGsY1HIivZBqywqNgSczxwGhbzyTVyzIdCI9eZMAX7L4Ta0AZcd7B9WWR
         fXZInLBiULCdZ78ZarJTHgclfPgdA/DHohVMlWK2Y5bxruH2oYi4HfERiSM82TdZWlmQ
         f7BN/uyu4wOIUGeMq/g+cpHEAeeJBgQhmwKNG/jlUqovlezB6O+KdH38oBmfZ+HG0kWd
         r5aNP7NnPlNh5BgOkrZHW3kh7IWpSW4A0JeM6jlCp9/gB7xmo7n+hTyzdMp6Uf4DUL6S
         lCAA==
X-Forwarded-Encrypted: i=1; AJvYcCXR6s2vNyCDR4zWz9LMGA5hwZGiXqd/2LSagW1OKKNvaNEzD5/rvsXtX1WnqX3nkNffdrkYJWYqmYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlJEU52YskIIsQGAhAj3LtLx9+cNxWjY7YZd3aLeq4ikUKNgn5
	FGkdZQIjdCbAjBQa/nFqQvXaTMtUzrYMHWWQHqTRvNLNqK+/4A6C7KEUegWuo+rGMGFacSNU1RT
	M1IWNOeUf+udRT5ZpspAMMStVbV624DCsf6GGqJ88GC+d4H9DCo2B5Fo3AzsIatU=
X-Gm-Gg: AZuq6aIeS+/R9v5typuJ/pPKuxOTpf/R1bu9KoFQaxjDItWALGHvpIJ2wX6v6arldcE
	jhz3felqoR7bPBY7obzCtJ3Zrhvyzs2Q0a45AhEV41j9K12jnjJm2c/gOjW8OxND2RmlMzOmueH
	Mn9bSeL6xe8GgGoky1meN5CslSoR1y/j4y8vf8ICWf1E2HNH9au4AW6rRayB7N2KdF8Ip4XXIg2
	uRQM9MF9mN/BBqa5ANv/T6kPx0YS9leUKXJt9/trqc6UutFqbY3pTYJBLtebTkrdGTewUw4voSN
	s0cuOHr4eJ57L5WErlONv6F3ytlBS9gl0J0Y229WA162EVsTdQ/UX33lKavi1JgiJxqjHe0FByw
	OUSKr+v4Ne+VvEYHAGtevF4/f9DodayrogChq+0UmpXrDhAdmf8fQRK0wliSxjbzUQnHMgF/86v
	7nj4I=
X-Received: by 2002:a05:6214:6104:b0:894:9d67:7329 with SMTP id 6a1803df08f44-8972793d999mr24553006d6.2.1770892741809;
        Thu, 12 Feb 2026 02:39:01 -0800 (PST)
X-Received: by 2002:a05:6214:6104:b0:894:9d67:7329 with SMTP id 6a1803df08f44-8972793d999mr24552856d6.2.1770892741444;
        Thu, 12 Feb 2026 02:39:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cebd31asm1589459a12.8.2026.02.12.02.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 02:39:00 -0800 (PST)
Message-ID: <6bf4b94e-6ec6-465d-b0d8-0506860afa6a@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:38:58 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rpmh: Fix LNBBCLK3 divider for X1E80100
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3OSBTYWx0ZWRfX3XPhde0slw/X
 qvdX1nw+Hi+2JvOHMVCL805LVjxfZR1xMbmKZ2gTVuedjy0mSADQ5WyxEXkyoejlIXrIGskNsdq
 vdpghom4aJQghkHloH6a16UN4nxo8Lns7C3X6LvLfCh2edyuJwBKKlZbhsZev68laEqPLhH2AHv
 YbKGM3ivc8yBWFAoRoTQWXIon9Sr8gbCo/Dcdav+8MesTpIuEbyobOLCHL4WUkRbhhva2PJuQfY
 Q9JpGlqk81lf7VXSvMwJkfXdHTjqRYFbM/Uv7Tox43pYF/DqwjXWJKHoyNPAByMnzx3fE3poYn1
 PB39zEHOEVsTp3l+33OIL6oKcd7fxsypICWyRNuXUl0E5MFK9/Y/EjmrjQbIjFQoVGEJLi4/R3v
 m6ZcnnCPFclOtGkR6Jj5qOi5fQ2zrmCpw25rNqtjpsCf2lJs/dveB8d0HWXAtRPZ6KZ8rolXCHm
 CHr7c5Hv6DhSWi1cWcw==
X-Proofpoint-GUID: Zmah1ALbiCQvagrBd3vxC1L3tI_ge1Tu
X-Authority-Analysis: v=2.4 cv=Y6j1cxeN c=1 sm=1 tr=0 ts=698dadc6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=ly4eFjZ7uZWBmfg-hx0A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Zmah1ALbiCQvagrBd3vxC1L3tI_ge1Tu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120079

On 2/11/26 7:22 PM, Taniya Das wrote:
> The LNBBCLK3 clock used by the UFS controller runs at 38.4 MHz.
> Update the divider value to generate the correct output frequency.

Does this also apply to e.g. 8550 which seems to have a similar setup?

Konrad
