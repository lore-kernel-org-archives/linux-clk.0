Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C6D318EFF
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244190; cv=none; b=pmASjzWARDytb3BnL2b+rlCdqN6kNxiJMFVir1BIQF3SRAlEzB61CaHM+n7nXdgrSA3UgTtiRCLGLK3ExrDA2XnaXXzn+MuIjN8D466rkfTA1/8ocBJhxJaZbNuogC4BL9maA5EfYyO504iRm9x2VMs/sIyPGbp/tzTWOZMOt9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244190; c=relaxed/simple;
	bh=zSp3ZEs32LHBIB7fH5TNXRrAs0ep4nZTBZCp3RXODbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vs70DW+5zfQtxTEheK10dV5ievog7ftrL8Rq0PBXR4z0FdNVwD8DF4absNhowkVX5tYhGw/liOCJUP5SvqtUzQ35/7JMIpz5XeTix5lflb7DCQfHiJpcWWtBfcaSctLQa2sdZy9Nfk1ezZGQZm0963kQ4r+iz/3F2vadpymq2sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MvbVJdaB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FDx92XQq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MvbVJdaB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FDx92XQq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F43oXw3759256
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 09:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c5CT1Jp/CdKTDY6Qft+lN/F8XFsY9d2RcRwPpRnUkDI=; b=MvbVJdaBirpNMH1H
	Qd0xP2cb43lG8iJF+zyx08lBmlrYDKZPCGOzhpQW+lSRlGYAfhb8BXiRBxTyYRyo
	VxCb1GvEN6Hw+8QORCoZidwGft76gjxYBFwtMZ+CSBDIPsH2zV62bhGFhZBQ3XCe
	/AV6se7FlW6PtEEbKzMJUGqCPXs1LFqYltFZEpaHxZw8tU8cJRBtf4PuTAif05Gj
	CMxekpgJIYHZ5JHkSIJDIBExAkziKqHK1tn3VKC0/XMyafI/epg0KUk/bfLI3ysX
	+wEHi3/R4LFeN/mZdVRth5pnWy1WY1wJfSPYJCeYa3boaeW9o+EaVTy9Hn/CaS7m
	nayFBQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtg0ahcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 09:09:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35dacc40f92so6786855a91.2
        for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 02:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244187; x=1776848987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c5CT1Jp/CdKTDY6Qft+lN/F8XFsY9d2RcRwPpRnUkDI=;
        b=FDx92XQqSMd1Zgj24O3YqebQluGWtWBsEOvCKr4eIg7JZWN7bf4Qe3CkCPGwgk4QzS
         P/UfjoGXqx0eUwPyY1yolZS8HjLPbAHCndSEazlGKusO8MHxcNuySfWYPQkTKPd2JBMM
         vcjnTglOR8skUMi8orOdvvS3YI9m34Ck/NnKHPg0b/SfyCywFyYgFey37NHNNDgbQM5L
         U+xcqHTPeK3FY+UDlXbWzMu7hx5JLB1A9LPBWCRfM0pvZOaRih1SHevEJi26srEPnBej
         qf5CXFpo+i0fG/jNdy/gOxqYQP64e72gdSMahPXT1e7rbywAxG+K72ETTEZvdOJgrhOs
         jmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244187; x=1776848987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5CT1Jp/CdKTDY6Qft+lN/F8XFsY9d2RcRwPpRnUkDI=;
        b=N7w73aKzjM4LgReR7VTM3oH5OPczeDrVxz7fnbweeUFW5H7SUJsbe9GJo5hQ0FvTkW
         KH96XiDSJY0H1xIYYEFboiH3autJRR59ozjfJLo+EyxKG3nauuZLkqpXsMXQVI2EoNxy
         bEK1LjhHVd11bPRbirRzlgj0vN6FX3UJZtb/bIcxmzKH5Lt45XwYr2HhN6fQGRL5Mfd+
         v9AN6WgrSwIlOvMn7HWv075ZLefgWtpPEDqbcTWTmTVvvAujFW+gIqMTKuK7NrZY/Ept
         2f1V+tNJpYRittGPYscWydwYuPwlHz9Xkc2ARd3UC/gZ+QbaIbm9mT8dbv4p+TbkQs2i
         onPg==
X-Forwarded-Encrypted: i=1; AFNElJ9Z4b/vP0yu2CLrWPjfuDs8FPkxApLqDJ3ovmcSIruyGaYx5tjXKr1k5ieuQs0TK4PjPye4OapSBcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKZDoLWII14N7Kz7v5DJzB77jOFC4y62YnSYJti8jWA9za5sxQ
	me/DV/JQlzwGZ+tdo7M1Y4sPuRapxX93ddS6u1SnEaoLZzXUxQuiG4u4DxUc0lmIJTv6C/7efSL
	X56FFFUxAOY0X/O+q8gcmaojoHdEqZf57FR/nRyHGSx3GW038uF62nuZF1LXihGE=
X-Gm-Gg: AeBDievPkT7zC12vebWbntJWohE6Ga34C4Iq1xPaIYCZEGj7Rt8ZCk0+4WOji1YH5t8
	5msyTuCKrlfuatjZRIXGez1iToA/P6oZ+iTCebuoEpzt2FOXJfMgPFkLh7gHur0TT9zAOafqRd/
	MNQs/48wetClNvsNNTywXCCeqSl5i4BVnZtJkppGuj/NJXFDtwGtgO1Lbm031unFqN7JZ5P9hPd
	baAyK+QaqfdfMdiVpYV9oAo0ss0EQ0TtrisqxMDIs/G5XwyD0u8j5nbud5Jv2MwFqYKHHF/zuKH
	YWbaX6Mdj5Or60Hz263N2X8v52IdiINgObOeNkCiFMcE+bdQlnQS8Aa/Z1OFh7g1hZ1xTNQqJ5s
	kOgAwOq/lbjvTJmixp1euwhPJquCkujA+tGpS4POXDz7UXSoOjr9y13mbWQNx
X-Received: by 2002:a17:90b:33ca:b0:35f:b4c7:b626 with SMTP id 98e67ed59e1d1-35fb4c7bb12mr11763274a91.18.1776244187386;
        Wed, 15 Apr 2026 02:09:47 -0700 (PDT)
X-Received: by 2002:a17:90b:33ca:b0:35f:b4c7:b626 with SMTP id 98e67ed59e1d1-35fb4c7bb12mr11763219a91.18.1776244186933;
        Wed, 15 Apr 2026 02:09:46 -0700 (PDT)
Received: from [10.217.217.166] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fd2010246sm2343736a91.6.2026.04.15.02.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:09:46 -0700 (PDT)
Message-ID: <bf8a56f6-d7f7-428f-ad95-801eb16f1cc5@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 14:39:38 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: common: ensure runtime PM suspend
 completes on probe
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-3-4bb5583a5054@oss.qualcomm.com>
 <c72e02c7-57d8-4353-a6d8-9dbf4f7a7e37@oss.qualcomm.com>
 <38aa8c0b-fb29-44c9-a346-363220264c7c@oss.qualcomm.com>
 <8d7baebc-db38-403e-b724-d4b214b5a51a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <8d7baebc-db38-403e-b724-d4b214b5a51a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AszeGu9P c=1 sm=1 tr=0 ts=69df55dc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=rYsFMFq4sQQjBG46XAoA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: NwEf4QMJ1kkx2wgH5Bz7ZQNhE_DYB5SV
X-Proofpoint-ORIG-GUID: NwEf4QMJ1kkx2wgH5Bz7ZQNhE_DYB5SV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MiBTYWx0ZWRfX5/niBe4m/iW/
 p1spwuzuxK+i/yJZt5n8ymc/7eMO/P6EkCcEuMuVhqz+OK6S1Tvu7mhs1AErxJU6wmdsBlCtuZ5
 EnaARz8041JFR9hRSPlG5FC4oIf/q/AKgMNpo96A7/v+Jmxjp94lWAPMZAF7Jq64Wsc+e9zLqk0
 z6z9PDnP4zyr3+SYbv02SWPNcuNQZaBfvxkb60STdqPjUDW6kSWdovvN/e1AwKaZMMgGJdnIvMb
 9GlCderUD0zBU33gaOpp9EzmDJQNqhJCeMj/7+HL4f5MAdufxiJHekNi2Bvt9rcDt4+bWDwcXVM
 BRLVDuBwHSFM61XdHIieXgvWoM2niEepCm3Ko2QZ07lzO1Hct2X8/q2mv6OIn3s8XeSw9CH3vWd
 ygPPM57ivPVdCe3SCjytSNJyYtpT+u2QM6nzvPlVqVrNgMA20oab08U0lI52U1xYdzV3nAjXFa+
 JlkW8jTRjx3uJSKLZSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150082



On 4/14/2026 8:12 PM, Konrad Dybcio wrote:
> Please mention that you want to do it on a clock controller device
> registered through this function, because currently it doesn't seem
> to have a functional impact on the existing paths

Sure, Konrad. I will update this in the next patch.

-- 
Thanks,
Taniya Das

