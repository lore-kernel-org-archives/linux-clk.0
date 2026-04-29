Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C07385507
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461247; cv=none; b=eN0dq/3ytUX7hZxDQeobiVyGd9VU8oCQPBBx1HswIfKyVIg4ald3C1h5F866HrTL5w/CYxGF8am0MAqalQKCpNBMaL3YIR+3r4TJDIVSt8och9uvkYjl+Tmo3hmPAkZfh6Av1XDuZXQFa1HH6rL3sHRdaMll/C8ov5QibSbe2I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461247; c=relaxed/simple;
	bh=NwdKNv9Hu+IWNEVQY+p5RpQP4NJdLi/dq8xnqnYaRwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VojH+d9uRyUPHgBY5rZnCaDlhcZ5vfaI9BSBg8GQTMabGlIXkjti1YlxGRyl3CNOcPX/2VcmMpZ5x/tRG46yW7AXBO7N2hd6+GtVqZRzF6UjbcpUj3EVisBvOCeDG6pHxBnhovoBblZEelbflxQJxIn7Ud6l2eE/odcKCiokKNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4ci4D7b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5ZRz5vS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4ci4D7b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5ZRz5vS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qXwm1642983
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 11:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j992D0crgViSah9SzynZETMed764JJO3ToIXrer4z6w=; b=L4ci4D7b7m9Y0Lvd
	OU5xI4yGxG/tQDYOuW0NfXMpXASZf4an0LV8mRIkadB9P+TOzZVFMQlhRWmBEqPw
	YUz9AOFe0Kde4xtFhJewM26paqu6gOy+ixNU6jRpv9yPlxKtexrnkpTmdrNKuoRM
	kyc70AJeIqdpx5w0Xy26kt5Dk4/QnUU0GeKHqMXcqLx2PeJ1QsAoNpFMni9asUPI
	sECI7bfDWssTt50K6ohMoY0t+po/ivuA+DBDynvjgjWHcqKqeb36UNqwmhNJnZhm
	88SW8ZjsoUIwxETWSlio4GWy3BxsJTydMh7Is4Ju+PXPinn+NOWfyE2/3Ujk7as2
	AtxefA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj8186r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 11:14:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35e59791605so13548104a91.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 04:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777461244; x=1778066044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j992D0crgViSah9SzynZETMed764JJO3ToIXrer4z6w=;
        b=M5ZRz5vSxR//HSfcvO1iCIWg72UNeSjClyaCGHhwZkDHGploemhrZPD1HzrpgPEibQ
         owimUM0gWRRaxWizjdFRL441dhyJr6EDSL32YmVtFJD0PWH0A+ePaEWzmPQKNn5Q/Ilm
         jJmwmZuxJHTkavqcQ8tYhfXcFTWk/caFmXSIlpW8h6S3gFpWuzLJxb5QVqysSiU3WqA2
         f0t6ZmiVkAnL9B7ubkRCYhyUdjqqlJuhmPs94kMySI+lGzdYNJ7duAFuV70k9kQYnKuT
         1ajN8PCbNkoWAjD6xI7mxCTLFO5FZgPEsPeWrrGOzJNY/3Y9yUrs3uIq3A1JxcobpvF2
         kfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461244; x=1778066044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j992D0crgViSah9SzynZETMed764JJO3ToIXrer4z6w=;
        b=L8i8TpYnglwRoFnGvXYRVrwxg3TUGaWTqBerCZs/IqUqCjED8UDsby8d/kUkv7fiDO
         QJOS28uLQJJOZWAA/jNy32zIde6S6gzDt1UzOaHg4gAzjuGlwRlCbeG9kUe09PXEG3hD
         4iL3Q3RehA7IgFRT5a5F5N8zpN3etD5ETjLrbevnLtBDTFXtQBrXOJD0aygyI7H5+InP
         WuSuiRHWir0WZak+tQcUKPWYu3jtrA+89nxnnC4Rt2jWiKQAhr/eEjKRWGNh7rfF/w/O
         GhXHYIJMkRSmhaBGrtUuY9yJTrN+RFQaz3kqhDFk8Z0X2B5uGWJiZ1RFqW2K5fU0OLCA
         /VZg==
X-Forwarded-Encrypted: i=1; AFNElJ8uSxd4nLBi34NBarjAT2jITHAnXzATedAQuYbEQledvvFp3zBaxXhViDw0QqA0nQlEt65bGAVRFqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHp9dRPZRPsahyOJ0h4UuZsLjR8D+s+HoZqrbll1M0DWvYS84F
	J6vzzYHBwTcvrO4yHzhFW+jlmRi5Xd4CEhl/71CEbUQphXR8Dm/Eu6z3lCbiKdZLG71jl+ppmKp
	ykCAheqMl3TBQ44Z7gDnHtWUEJloxdZTQF0dPlq0mb1lND6ZswMpZYtzfDkflY9w=
X-Gm-Gg: AeBDieuRft6L1eYuUfGVWmXe5vVYwQN0Na1io4lzYio3oewwGSbvPuwKtRLZUctA1jm
	G+n0DNlwLsElpsbSKHIzwOZURH2ZLPbIdO1dU01kFlkVazmkvR8ZOREoe9I53out4dIibgFEHMu
	hD37fd8lhwK5aGVwLq6xtGvzfn4U8seLmexyBPMhvddyxpvM2C254cXJ5hJtHmk3VR/1Dk1Nvm0
	H+rvPLHJWVIBd10j3OpoS6hP1zaY1+riMxybf2PpqJmgCrjXhf2TgIXhopc/lDMkBPiZQbgkm1Z
	1K/yGqpoJsAq7FyuNe/Y14DJ6M7AaSBM6+ZfdwlRmbRGwCctKYAX/0a6fVzehMRSnrx796ueKCa
	xlXivrhZK40zj/cSIR95CyxvSZP5YS8KE8I7Ctr8e9Fu2mcz6oiMEv5XhVLZb
X-Received: by 2002:a05:6a21:6da7:b0:39f:2b9e:e489 with SMTP id adf61e73a8af0-3a39c05b9femr8322388637.13.1777461243976;
        Wed, 29 Apr 2026 04:14:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da7:b0:39f:2b9e:e489 with SMTP id adf61e73a8af0-3a39c05b9femr8322361637.13.1777461243538;
        Wed, 29 Apr 2026 04:14:03 -0700 (PDT)
Received: from [10.217.216.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6067403sm1735002a12.10.2026.04.29.04.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:14:03 -0700 (PDT)
Message-ID: <be36fe69-e7e4-41c1-9dc7-dc2c3d9af563@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:43:57 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
 <20260429-shikra-gcc-rpmcc-clks-v1-3-c3cd77558b7a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-3-c3cd77558b7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CGuowuMUsHppY9TWvUdUqambbFPyvAFd
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1e7fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=G-4fGFNKO6kq0i09DNwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: CGuowuMUsHppY9TWvUdUqambbFPyvAFd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDExMyBTYWx0ZWRfX+3A9V2zenr/S
 qnk5fq1OcwOyvnnh45Ty5CXKhwMXxePNlO49/1U6KhkNZoidiRM1OM0kx4g7iAScJGOuUyfD6sR
 WsVVEDJTCL8u/KjV/HaMYhrOiTHjh3CZC6rWbUbJ37xPtmYKHotbLCfSbn5kNLvTi0QxrqkYEfz
 2uibJX5kU79l/ozxhRE0B89D7cQMDXwS7mU6VQaU9Lzjgn1Y8hciJfcNkR5kSajR0rHs02Ybp5W
 As48BxVTGG01+TAu9UamV4qWwKNNFe+ZOKDNBK+h9d+6AfBUjtxrfns1BrMezGQQDwGU5boVnpl
 6ZVnXfKuwc56QjA0d2xkDEvODg2Q07+g+PnBywM4rhCbDdFDlLctgQ3okQy4TqhRpid4JsMzCR5
 JBtLKqlhDbUYJhoexCyJVrLThJuNfP0Ij6VCHzEpQzcNcizeUEJQu84z5ByUS6bWF6YASwUEa43
 1j8OLvW1seU50JZAZ0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290113



On 4/29/2026 4:21 PM, Imran Shaik wrote:
> Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
> list is same as QCM2290, hence reuse the same for Shikra.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

