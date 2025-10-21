Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03662329C4B
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038970; cv=none; b=VTD5n/BCgZTSWlx8ffxd2YlyGnYlt6KEMY39pB140Oj109l7AamfZ9fMusqcs9fpqaHrhl84lP/SnISoAF0bFrZ085bfy2oKEusaP1w552U5esPbwDOwR/glTw75fJ6sxVt+z3I5ZgyHBTXuYLM+2CIui0o8T6LPB+txwTj2zj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038970; c=relaxed/simple;
	bh=Lgkx5HPDkqjxZ87HJBcNSye0fzmxDpuWBWFLKUcBuJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=esZu6P31z4iOu/vUg2nJydyyl4Cy0xMrUWldQA88IHQNCaaltKmNVAy2ULdw4TeEdOazw/HDvoEwAOsWM6Um/OaMs6Toqi3s2zuoFl2AwA2anB0rvGj70lbNH3fJtiPlMuUonPy6745YfwAqzu/oi7bcQTWc2amkhSgT8dIQHqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eEsB44ae; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eEsB44ae"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8VjtT026555
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 09:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vchtIDKRTnCYbic8XdnIHZKcKNAB2qHtd73EA57D55U=; b=eEsB44aefSWI41BE
	W7FmzAAbWsxaqRsbY7BhATESzbG+ZjNUet20iA02h/pSCGzDK8Cl7N4LFSjHrzcY
	TFpRLlQwPy8xCqxuF427bUZbU8FpV/rgC+OObwb6mIF3z4tmDfRa2DSaGuyVF05p
	OIaeAKGOt5KfegvFUMq4RJsDVsJaGCsX7CZWervhYAPmVYc+G0WrF272NJZ/bjwi
	tYXms/jvasWANdWp/n1Y3QC/8h/xkR/27oQxcFsjtByow+wQBUFmyjOegxMZbfKd
	woLJa06Zf/ocJtCOWGIXIxj2wgmEKNpJ6H8qtP1SZ4t610GcIeU+i0tp9oibIiUS
	SY+NJQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j06mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 09:29:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290b13c5877so111497395ad.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 02:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038966; x=1761643766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vchtIDKRTnCYbic8XdnIHZKcKNAB2qHtd73EA57D55U=;
        b=ghec598Qs5T7Gp2SwrcLYXxCKWjVMdGm8dwnqN+4SevMthabQui7TaIBYLi20I5ama
         u76lKwMfM/95YRi/7ucva353xZy8PRTSG5rmHj3gC3FbOZIMEx4PvXsGorFIQIdK4ok9
         uY++LB9bm3zvq8oxbFlw2lvA4WpO0ZO5WHcmCm64XtPtBq2JeYMB0eJI7y3erHQ2LPoW
         qr9BxWG2/EnzBmUbNbMqTcTxZulwq9ScLoAvEOr9U1kyXWw7ynjmXLY3cxRLU12aaxc/
         I8vO/mjJoCkHb4Ly/t/Ut7JgoIRHtjMRCXU/Gsvbf0uhc27kqxKZJtKBkpwhCveyADv4
         mQcA==
X-Forwarded-Encrypted: i=1; AJvYcCWvzU1rEMoVx8cyLX3qyv15JLFyEGOtfcYhU8pk6hbWHHHPnA7H+65CMZJpNGOUkxo43F4rGr2MvwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfX9uwkz+S7kuq/si+vIJsvov7v615/ZjRXFAEb3f1ZghmaXL2
	LodT29xZbyvY0eYopEMtItpTjXHKk9bGv3dG4zfvnnX29C+jU7Sid1kZVhYEcFM/wYLU1ocLsSf
	RSwt6iTrfEo3jz3hyk8fyGa7NvKlHKtPi5wzlAYaU8efSgkzmwKKq5Or8eGwYVdQ=
X-Gm-Gg: ASbGncvxR7Rnu3dbFWFJS2GoYykAPK0HpxtDJRJT+JVq1Q9a240jo+qwhgkf0daTwQ+
	aQwM61MEuEy/EXiHQCb2nJay26lUzmjsATD+2tlU0sR6P4QtIitTciJ9VFMiWdL9bzeX0DZLd5o
	4sThe1UaTXpm0AuuMbdH7HKK/josL4Zs5cypy83PlUKupjrrgHEKYHA1Pzs3fJFfXNLnU2EmKUM
	4+eMNHjoQAWic0Y2NfKuV4MYj5VslxL2T2NTSUgE8nylwpJI6HukJExCVNQ+Oim+E4sA8O9wgeP
	H4bAkLz1FaSCGEYiCTClqcqSiA4Te/n0Qss7K9w0dkm8gbdYhOI0qt/DaIkDk+lQY33c8bxvjCg
	kc+md1gvI18EOfaj7B/815aYH1qo=
X-Received: by 2002:a17:902:ce0e:b0:292:324e:24bc with SMTP id d9443c01a7336-292324e26damr175702115ad.16.1761038965718;
        Tue, 21 Oct 2025 02:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOGC7PHugaE2XtwN/5ogJH3Nu6q4RR8mM10kZpgisPKy4YenMfCVuiNGzBa4/+043w5e9f1w==
X-Received: by 2002:a17:902:ce0e:b0:292:324e:24bc with SMTP id d9443c01a7336-292324e26damr175701785ad.16.1761038964961;
        Tue, 21 Oct 2025 02:29:24 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcde4sm104829805ad.5.2025.10.21.02.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:29:24 -0700 (PDT)
Message-ID: <fda2da11-719b-4552-ab5c-d197c9f29092@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 14:59:21 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Enable runtime PM
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012230822.16825-1-val@packett.cool>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251012230822.16825-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX2SusWMEMDXph
 +3ZuH1isvW7TSvfoC+hzWOs7xoFczH7oirjHCqzZQr8JOEQj8WrpfcZ1LeV0QvghNkeudSvxcPs
 f8D5Mqb+s+eYpCl2bE60UwhkBVc8DylnKCZbFSlp16kTXyECPUHTmxFdsKqakQHjgban7HglWpW
 aDQ6aWqDgLWXpG4NgQYFpoNuaCnvXQm+d022TM0DCvg2LiPD/nGdufZYQiu0o5d9WAsPgimNJ2s
 vMPOO3gAriOCxcWzL5Ul3kf8wcjjjjE/GyPnV4P8NddAUEMBZfxcaWqzxQFG9shXEjVByjZnMYO
 1z6Nvz/QWmX8Zlx5J53Kt3x+ovHMEcFDAolob/KB6IeJJd3dLBLYrRkrA1WYCEaTihkXww2Imp6
 F2xOIAqA+x0pjivlPO4rTAxdPNuMkg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f75276 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Ol272ZaqoCEH_NYozqoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: HW9-yQZyXyKUl1N70AEuZ5rX6pNB163k
X-Proofpoint-ORIG-GUID: HW9-yQZyXyKUl1N70AEuZ5rX6pNB163k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018



On 10/13/2025 4:36 AM, Val Packett wrote:
> Enable the main clock controller driver to participate in runtime
> power management.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> Seems like this would be one of the prerequisites for actually reaching
> deeper power states.. I've been running with this patch on a Dell
> Latitude 7455 for quite a while, did not see any harm for sure.
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index 301fc9fc32d8..96bb604c6378 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -6721,6 +6721,7 @@ static const struct qcom_cc_desc gcc_x1e80100_desc = {
>  	.num_resets = ARRAY_SIZE(gcc_x1e80100_resets),
>  	.gdscs = gcc_x1e80100_gdscs,
>  	.num_gdscs = ARRAY_SIZE(gcc_x1e80100_gdscs),
> +	.use_rpm = true,

This is not required to be set for the global clock controller as 'CX'
is the rail powering this clock controller.

>  };
>  
>  static const struct of_device_id gcc_x1e80100_match_table[] = {

-- 
Thanks,
Taniya Das

