Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D567427280A
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777121068; cv=pass; b=e6uH5KtNS2/K+B9B64+caj6NrCww74bhjetCkPj3hbNF4McUU58ZN/81SdusC676Wm9hhFiQqjPEAMGBD9XiIxekjTquYMEHBFPQggA1aHPfrTTBIKznfdsZbdx2uSNVEvQl/HqofYIg1yU8O19JhbwmkXtCuwtda8AlFDGpG4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777121068; c=relaxed/simple;
	bh=KUYDmx7eiabm+HGT1KP+Jx1NJLkN+s6k9yLwElswyYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XoRWTdit5whuSwA+rP8DOYSK9vwj3rIWKX8+/HsQRIB+e32lgdYNFf2fE0jsswyfml3Hc5tsFKd3J5ZbYpxYshc2U33ECRurOCXb+326ttrxXVYINxHcb5dTETuGCAqwMsWzHrRpEvkj+TZGb2tAfDpCJyzARb3nfo09f8SN3Ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4mCncOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Th4Az1Mf; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4mCncOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Th4Az1Mf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P4e2pB1557162
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 12:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZZY1wpChvcN8rekkpdNoXT8C
	eMSoaSVM3w746nRWCVA=; b=I4mCncObm0sy6AcdduB9Slp4L2ZoqendxruAmIcu
	8zbJLCmD6BDKPsgohFqKklX1A+NLBwehVw062utj07HH9dNtjWPJshlcLWddAUGs
	QYRIoC+Uw7s2QrUUQ9x9sMXNTpXhlrUO9u9SrlrbHAnJQ49TwR+B/hQvvXJ1ouI6
	TvCqNC1z4RvWAyiqeWYrqvZqmhbMm5cn0Zqg5kjwYVF0434+tv9u/XNvuDd2i36r
	58Z41PVth1kBhC1mcflLWEPNDIh9HOuHLpSzZSvHbrjkAXbUsBx2/0zKTiml8Izx
	YjCUAn8AIdhy4emHq2bjwjcv4g8jDaulQDeK0+6oOX2fiA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgrspb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 12:44:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2eba42b8dso76489635ad.0
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 05:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777121063; cv=none;
        d=google.com; s=arc-20240605;
        b=SWXlUoERpUmx3xlk0bbFnfHCI1RfnIwkbYQHytPdGUMc6f3GzPrOJpOWO2fAtywXyv
         zYMZUS2RxszA5t1jrK7Z3lURz3rSHc+vtgAwUA106+UOfsuMJZKilwzvSGZxjooNGaHa
         SkPZhbmQFd7zgoDeIUnaHkM24MqR5kWrTfuHYLOyIKFQgtCaSF2t3Old2e/tcZB+KNTw
         aeJHDgVgMaia0WIeVx7CiS/K00058Qegl+5gGp5HAJ/0KRywphbFMYfQevO2h6Nl9a+Z
         VAh4Y1nNv3cxGCfF0lmQ8NHEatSQ0jn+YmUNOBtSP1jsZ1m6xf8PaH0ybBsY9D06IVEE
         C7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZZY1wpChvcN8rekkpdNoXT8CeMSoaSVM3w746nRWCVA=;
        fh=yvVArK/0M3fG8XLkK6FeHSpnLUleDKZAjIeaWMnZw/Y=;
        b=J/RImt7z+JNojo8eTRQFgAtbqzLG+WFliP/j8UD1j1ZjKB5ve/iWlRZQ3zeii4k929
         qRxOUcSC0LFWOXKZ0oaXy+2vtHN3uRHj33+cWgmaS6jZx6guy5NmloP98fiQszm394Yg
         4lrI95u8bIYziLcVTXz73uKwEPA8si+sn7boJB3SBbDYEc6VITpt5FWc1VBy/LcmEd8o
         s+FRlgMCtD5NiFp2wL33Kh/saSePC0fbzS8gEEQWdL+xjFdDn24+PKkQZs+cuo9q/LyC
         Nm5rmMkr653q0k6/VO4dhEJPblzDmNJRUGnEhKd3jjGDTGGQopr1+KyntkX/vgxRdIwb
         nC2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777121063; x=1777725863; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZY1wpChvcN8rekkpdNoXT8CeMSoaSVM3w746nRWCVA=;
        b=Th4Az1MfvMCPqhQ+4cCzMHu1qQ3lizOqqT/wxzcFkVjyff34CKIYTjbzke4TCHqu9V
         eTguWCoR+cNEFc2KCoVpfSxTP18GNRpBmQeojkVnkhu7l1B8CNU2E7HjN0FQ3qn4C7LU
         wfVImkT6+b/bV36y1EZhfMyL+lkD7UYCAYr/GEww+IkbGaR2ddCy1385bqb+RnbtIJUR
         YF4GLTwxcrLg18SeEcmdOV9/khATK4DZ+MeFxLDsoBl3IPpLhTTl+qQiqMp/xt95h0e/
         RK0WxWXQ/AWSApqielM8oV8G6zv0YsPoA/gU7RXJ2nxA933TfI0Vq27lA8d3r9U8OEK7
         yA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777121063; x=1777725863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZY1wpChvcN8rekkpdNoXT8CeMSoaSVM3w746nRWCVA=;
        b=kq5kZWShpPbERC2B3BAo6kwWotGRRiG3ucC/jn37WBZxRZeyZ87e+fG0RZphIQlY4m
         UCga0Fzwai8bejQvYYsB7FO9lIDHWTvJuG38F5Lmuh8M8hN87O1+QMTmevubhQ1kFoQ+
         BYN1kVVK29/U31wu2CwwY/TCEti4Y/12497f/O/k4YxTpu0L+oETgkGyRdC1cY4O+Cc6
         qvJgYlTcBcB1GgDlO0ptfufWGqZeBMEgM01U0+Y2XBxjSwN9usO8WpHOVtgesmtYaCxa
         Em+ynxQ1Lztq2kDXCAHnevxKGXdbOV7hnbZoRLXfmxt0opyvf0LXuCjC9YSg0XeRnr+A
         8AXg==
X-Forwarded-Encrypted: i=1; AFNElJ8K1tX4XFkgEhXI/9ZZUs8cbLFV+u7vaODUYIFdwXGdj2uHBNP61vNo+8h3TX5j2pDo7+HGF083z1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOz8HSGr3r+VcillV7GcwTcUzmSuIx/XPf9e3ZKJLMWXjjWDS2
	DpNjWu7u+pgJpP1b15jnFhF1baBfhb4hHi6TiJD8RR0CvsBxcw0OnAehEdo9YdOeohWlGKJXmDF
	FHjcGo+l50oV/LVi6aNDhxDe3oVBNQ6fxSpDu3YUxnVCkvdkkYCm59loHTPnxBpJNjFTA/YadSS
	6oQGjkYklo6aDB3dCEpUJDUkN20jxXAFaXXG4hcYqlEib5ZAIWDn0=
X-Gm-Gg: AeBDiesZlMR5UbW4tZifZiqfjAwhsQ6UJaNT4u+x1ZF6DvI1zvxKZOAvp8uZDk3U9D5
	51NOJNefZFvsAIRSpw8roYq9wDeRNvDOwipszxP9ExE6zcXVAoEtKgrSR5dsa1dQzDmUx+qrNb9
	1fSbJrThrGiHyVT0xk0i6NzhFhz99L6B0zq+Y57HdoxEVcbO1w9ZzRVHI7XZSBxKLk+D8e5Se+k
	KuKIHw2dTHA/Rtu75A=
X-Received: by 2002:a05:6a20:7f95:b0:39b:f12e:d53 with SMTP id adf61e73a8af0-3a08d732e29mr38526525637.18.1777121063235;
        Sat, 25 Apr 2026 05:44:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f95:b0:39b:f12e:d53 with SMTP id
 adf61e73a8af0-3a08d732e29mr38526502637.18.1777121062708; Sat, 25 Apr 2026
 05:44:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 25 Apr 2026 15:44:10 +0300
X-Gm-Features: AQROBzDbzgzoeQ8icEJ5INzbNAguQUUZZIoTnxFFoW48CUL8wpP5lqdVpk0EGLM
Message-ID: <CAO9ioeWUp_SBnkuNejRLb9E1UvrbCJXYcZr0KgWJgCVZKRLL0w@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src
 from getting parked
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: fpsj5St37pRViKGUBZYxA39dP0NDaWp2
X-Proofpoint-ORIG-GUID: fpsj5St37pRViKGUBZYxA39dP0NDaWp2
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69ecb728 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=q-c8-M4KSy-W5MXdCJYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDEyNyBTYWx0ZWRfX6HegKgew0ge8
 ZSM4dSGhUiBEmlnCv9m2/RdRwZ5yFE4Aqh4LaYCBKiNW87oEgGd3kGu9xwRBbCWk+DaGCxDSXTJ
 UK/BrMjIrsetm7GHxpjB6m6MASTNjXecRRTAUxX9TzrDAkoVbZxm29IV2apiNv04P4tdlangAII
 HMWi9+DG01m2e0uurJEg3vupNX+wakQMNG/fRnoBqv3TWwJJX69wUMjkUqyEeiMZ53dKG0R7uH5
 4C6eQ4FUSeGbTzU2zJtRvW6kInpisBvkXoD/0IRZB+7iWn6mQ6YTQAohylAZrKDYLd3MqCt1YAG
 PtoJ8UCDmwtDT0tQolPgKdpmQC7kWVZEGod0a1cupBt0ce/kpEf3wsUdQ9Kxd6lyvvGbzjr0MFJ
 FsjKiVgklYP/oz/1NbW3iilPoCT5DjMFJG+znj+MDHVCZ+7tfbEUD7OogLVvSPE8MO+1x3KKMvb
 EHqGz6ZogsDDTYPFVHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604250127

On Sat, 25 Apr 2026 at 15:33, Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
> to stop functioning. The EFI GOP framebuffer should keep working until
> the msm display driver loads, to help with boot debugging and to ensure
> display output when the msm module is not in the initramfs.
>
> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Most likely we need this to be performed for all dispcc drivers. At
least for all laptop usecases.


-- 
With best wishes
Dmitry
