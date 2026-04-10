Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6AD3DA7E4
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836646; cv=none; b=ZJh5pnrfsi4nhpaHlb+4ImnVLRlekK4lA1xMcBKIkWVuRaHWkmdB8R52ver3y7vISdDPIr0hjyXpWmh88Rpdow1jL8VpEbwvFKRyxRALsoXIQxMt9P46Yl6dYxM2wzqiQsdtpinF2Cau8KHOa7syOvQGM4g1qBKWnLYqwRwimaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836646; c=relaxed/simple;
	bh=qh9wtG50Yp48Ve5IdDl1scXXfBVhCvPgdjmlWGWHLRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDkoKSKDXs3ZBhLp/YRh2SIAZ6K4Quuv8u9E+cYfu0GBnEOcRQoZ5k5sQxOwXXK15WuN3V6kawCIL48RyE3/xDzFpR52ltE6U6/zCKOXsplHRik2WPxenudxQj4Mo/bE8rv/YKlOdV3ZeTx9nhRLf90yhK29ypgR2s4Ffkdm0FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzGRHItn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JR4OTJ5F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzGRHItn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JR4OTJ5F"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAp7cm3742904
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vt1fY/hZDTpSME7QkNrl2ujl
	DTe43Za3yhtgb4mp7bs=; b=fzGRHItnZik0H4frxR1Zbiw8DBTC2aLwTGj2Ix84
	QSoMcBViZQgEyBCzQkdfs6NZz1S1sob8trOsUkLRWzN4FE3oO/SMcfA8W4EBQPzw
	9+z0gUnjJnfZz2QjVWiXE3fdfIOnQyCn64ePPCL4prG5f4TDD3sfq/g0zjqZKm+V
	i/+zS15GsFtkn/Sok7SPZMjRz6hUfY2ewoziK2GTWFsOtsDbOnH4w1UO51K1m1kU
	V7w/Bmx/PQmCDOL//KJR7WrOAI7E/15ArCdfq07KGFT1ZyDjvVbHnJWq2KZcNcVj
	zje3Ydx+MWNGkp3Gs8othyFXl86AVX96rG8aFXqYbE7e7w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deytngw6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:57:22 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c283a1212so2876454c88.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 08:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836642; x=1776441442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vt1fY/hZDTpSME7QkNrl2ujlDTe43Za3yhtgb4mp7bs=;
        b=JR4OTJ5FGx7hWbyqEOd37WjonN0xe2EDuTK+HdOQHuIiWUBONC8QWophb7WZSagXXx
         5WUwFVlrWXhFL8oWw57iaKrhSC8MjrzUD0nqwqnzHUvmiTko97Zj+bRjIJfaY++N1VE7
         pVsafosFlGBW2uqYKxsi3v3B7wZ7RxyPk0kt7D2z0PdQEny+J+mPOzxm7P3oSVDDadbJ
         pybTDcdBjg/Zlwj9CQxmTSQGDDGFSaOifyg4suin2AZcH0lpCLUJ6YIXixJ01yTLYARR
         3IibNAvr2hEf1F1tebEbyeVGcPurKSc8mordPls3JoAhP0MJDx5/hoxfzs1J7niRGyuD
         Z0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836642; x=1776441442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vt1fY/hZDTpSME7QkNrl2ujlDTe43Za3yhtgb4mp7bs=;
        b=bwjpBTU/pCgbWrrjOzZbVmEXvwc+FXp5WY5JcNyhvmYZ+Ly8Jz3Uab0QgTJkSFwj4h
         qt2a/A5im9SacunpgY84ZCVKje3zSN29bKInUIhtpOqXdIolwp9ltxCXI2FNntRlXF2N
         S6nCGohgBBCQ6jYZj7G/7Nj+qtizG0KEIkpeHveLGI1pzA7EfOG5TPH1vKYPRfd3NhoO
         5+uDCaibjDxTj23UJRGhNEu92VVif3qO3b/0hJQMJquqrqWMR71UOL3sPN8hfOOngl3n
         M3uGKIxHWqmy5ii/tQlJefYEKjPqebkLZ3/805p2XxE6Wpa0vQADxtmJvKw1SwgGuYbY
         XCkw==
X-Forwarded-Encrypted: i=1; AJvYcCU+UvR4ji6HB2bxU/Kw1XXNdrTb5z0ogWY1HD1zh/5hDP/hXzsQuTXQ00rElQANVMJf2NupnTCtdEY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo9dj+uqxQsj54grOJu9vwrcw8SO6tJ1SQJnZJ+PcdKJwxisr6
	S0ljyPAYdfCaszXxImIjPBVnWq8e7ty2HEh72oKBDALjjPcoYwNyN+h56ivSRJbW+dzujEIbest
	HNhd6vKGBFbKP+HR36dBlDOnUa9phNr6pr/7pfuiznuY2/51uKgTNNn2hKYyI+bs=
X-Gm-Gg: AeBDiesyJT+aairEwFUminNZ1wd7XKi75IHwjaiRPSXEm6WaIf7s3WpuD494MTIgHEH
	uypH51YCcfm1qdt7wBoCMuhtEhxUvIJX1eYRUxyl8TPNFXsAMC6oUmyzvjZJ7fc9kWrV4R0aEi3
	nScr2XO2ZlKhvbEhRCqNFvbMAkMOkT1SIxyif2pxDxq7WwMrk0UOJNQdDv8d9yWDdDh9GjBo0xn
	VxXl4BVBmH2oogdTQwqf2krxy+GCZ2rOF6fLdvGUyf4nWJAoQasHceeUHLbNTaU8Pd9c5VWEoeC
	+5XtUe57Ha6V4nouB1yB3VdJctyULXeWbqUw9vVn19HuLVLej5KQIKXIBWrG3FaUb+K1xZ8zPkK
	q6SZ6vVp1CihoWJlUfp7y9C49T3QUZQ/GhVmn86B78EVcpRjw6TRVn9BaAULzggDgQ7z0+vzMSw
	0=
X-Received: by 2002:a05:7022:ec07:b0:11a:4016:44a5 with SMTP id a92af1059eb24-12c34efc9d9mr2249566c88.24.1775836642025;
        Fri, 10 Apr 2026 08:57:22 -0700 (PDT)
X-Received: by 2002:a05:7022:ec07:b0:11a:4016:44a5 with SMTP id a92af1059eb24-12c34efc9d9mr2249533c88.24.1775836641456;
        Fri, 10 Apr 2026 08:57:21 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb031sm3733104c88.13.2026.04.10.08.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:57:21 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:57:19 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] clk: qcom: Add Hawi TCSR clock controller driver
Message-ID: <adkd35ZFNvhCcTCc@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-5-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-5-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SPU3DRTFVOnfuvVD1JF3SUlBtPU8fiyC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX3iETNQ+9Vt6P
 AUzHI6mR3rzknUFV5StZ/P/pj8iXe2hU+PnxSarh4KpYhxF8Ok2Z+sqGWe9BYdgEiAaflG4vea7
 trusAgRIajM6SB+MxG4yPIkG/BAvuuQcirMfnMOXkRqHFk2S9BtLfKND3qSbHF3ckXPeSbeHO+X
 ik43Bb6YpgeC9srxkyfMUM58Ni/e2QT41OO1LHCTFwLbpsqrOQ/Jn+aLf2IjCxnXjsZa/Imf2nc
 mgb9zTzeJlzPvfm0gr/V0DfNxuXUTxqdmurjhmweUfw21BvFK0itSWXVRorlLrWHYC3yc7QvpX/
 4Zq96TAWy1KsBhLTslouMC5ZU62OdM+McDXyak3giEwAgCaFb66IBduQHK9QlI1wX7H1JOIy44g
 bkThucu752/XbPfaVNO7di2Qy+5H3CEPfkjGVBpoAibq9I6Ukrm/Cxs0aOBEq3hkCAWmA6Rs+66
 dpyHGJahbRujSpSxgww==
X-Proofpoint-GUID: SPU3DRTFVOnfuvVD1JF3SUlBtPU8fiyC
X-Authority-Analysis: v=2.4 cv=crGrVV4i c=1 sm=1 tr=0 ts=69d91de2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HxGML4-F7vsqb9dMjnkA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149

On Thu, Apr 09, 2026 at 01:51:39PM -0700, Vivek Aknurwar wrote:
> Add support for the TCSR clock controller found on the Qualcomm Hawi SoC.
> This controller provides reference clocks for various peripherals
> including PCIe, UFS, and USB.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |   7 ++
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/tcsrcc-hawi.c | 158 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 166 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
