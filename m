Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA1B299923
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 08:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584018; cv=none; b=r0m9HQbElMfSC3/OE4HoOTiWkaHmdcQI3Wtu5waZliOFzmtBaQYtHLpGlT8xFRAf/5eHLSUw/lnlwE7D8jARyxmuJrVX2uoiTg+tA4gY+YMjo53y2+wnJgU0TQZbRerhPGc4FZO4DwLhSLQmT/yde7U0iu2tmo4zBc49BAjC2Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584018; c=relaxed/simple;
	bh=6Lck5vnkQDlQUhg4DBtvah1Bk5n9VjtWTX+/GMT91eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5zc0+BA/b3hXGUe2tIG6FVxTkDkBCrLXlgOmWuZgxpxpKmxSgK+LK02a1jTsS473CyafXim2rqfLtFcEhcrYoCGaDnw22EGAD/1y707bdN/IKaOe4ooVp86cOLIj+k2BdjjFbnUvTDZM8XhPZjKExWoy6jUU8Tg9yBCflaUxkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DskLkMNd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZExMuMwW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DskLkMNd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZExMuMwW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669619bW892166
	for <linux-clk@vger.kernel.org>; Thu, 9 Jul 2026 08:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uMmpQEjGaTKml2KNT1Y7dXIp
	idktqGbKEdteaM96mzU=; b=DskLkMNdRM5m8582Cp8+Ya9V6RY+pWhqOedhTXUN
	DkSeDoT07r2BBh21l+QgB0c3M0OqnnpEPTHHeBGal3Ou7MD5yGVTIiRAVnd2X79Y
	YJXGYK/Z5nDch2Di92DZIkeKSk3CnMDuw/pplkSajfQrsR3iZgqEcWuNG2jTaRBH
	7spDMcUnG13Zfwp5tnVTxfP2WFN14m58JPmIP/hvGggjNcj+axRIcj7UedXL9LiI
	Vdot7gi+RiIp2bpEYpyZIWvE/sb5MHbaerqT+BjM70DAWbpsOuwz/G3O4b8XbngR
	+HNXzkb9SnTCfTQyTX1ynfZBgY7uwQVxU1lkfcXIa8FTLQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvtg2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 08:00:15 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9693878131dso515823241.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 01:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584015; x=1784188815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uMmpQEjGaTKml2KNT1Y7dXIpidktqGbKEdteaM96mzU=;
        b=ZExMuMwWkUJWJ/Z1uAQqLwr7eDxMULVQFy/H5Mr+FrGcDiv9h1YcHKWFLLeUFwjNiq
         MnzpgWtsNvbQ8h47nHbZjlHNtiCUqc+DRSDlar3AYDuVPfoAnHn5wsMcBdR+zesG06RW
         XqIx0p0DcgRvslgGBiA8g533+LXt7G0GMhws0OMvVtFCBUsZzKSi8mgskOAaWxao1pi4
         xEnYawkZmZ8ayuWFY51fQ1x1rYL2ZgvxeKMkj18rvCyk1POzdNHwE0ct7oD6KuaorFRm
         lG54y9TKtzcLwwKdiqzpZ0iOQoXWsbp8r9MFKgu3NRpZJX5YsJnbcaN7vx0Ez96Cs9ix
         mDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584015; x=1784188815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMmpQEjGaTKml2KNT1Y7dXIpidktqGbKEdteaM96mzU=;
        b=KFufT6V8SAbMY0S1sRCl3NCP2CW9JKvCyx6YjF6KknY0eyy8EG6AKPMLPYUcrLCbBb
         C/o8vK97okVXJi+7vsQFl8Pqf6CPIKUsmw4fw4Xm9DHzpVaQOh2eqpcj3ppY16Bln5X0
         fMwLLZOaBQhXtM9jtL9scRovVxsqlfhIpkeesbUFSAZ7DwsGlx1IEuOGFIDA9wdPAIu3
         jGLxZLYx2x+gpMwAJcaTYKN5nnYXzD5YGZHZthcCz0Cvr4AUL/IRg37uSctV7yMG9chl
         TzxX6oWsOw90MxQAvS5zP+repZRPulilqYUZBki183za4HPkaJyYvxfKfROHGo5SHswz
         rZ5g==
X-Forwarded-Encrypted: i=1; AHgh+RpCzJU+Z3dmJ45xuyWVz5XNdvT/FczFzfOHBCCmlUhpvAbCppIkuhfMiAi2FND7WUJtm4XHuliYpos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5cZHRl+5q9fyX1xJpnJVcMQ5NJi0siRY2gJ5ffILQi3mn5cLh
	VVL+lKAWyNiRLPwwDMdRsnPo5UEa5G/aESen+FY7o0Dg3DSMNzfFumsdDG0V6hXadflGuJ/90Mt
	A3fJstMrKRjd0fM13EmlpPX4rKiDOMarnKS0UPw6x3z3GfqUIv/0iUiStgNefMms=
X-Gm-Gg: AfdE7cm5TmSqlH7vrOWmUAYkvDYYwLBc+TftWQSVMZhPuf6hefFMaGWmCGcyd+HgzUx
	UxYpvRMwudH/q8r7Hc3wBA19qYxfuBTd6BD0xqekDTkv++dxfPlIZ2EtnLIJg02/bAKUoK7mbun
	N4szcUyl+6fJMjrFarCX2Rma+6dzP/FzvNsRwvhY11uSzMsXYsWZ1yrcUGvLNkmsQ+IoS5zEb23
	LvMpuexK3rw8KglZgAQlIxW4VVanLIXs8MSn+nHai9kI8pwvcoVS2nVGv/EX7nJ8Q6LlwKUhTzR
	RPJU/YCZv7jVmGHXNcMsRc8WUqvTeOjsfmzMlCiylem4I5x6A/6mS088OS1Dyq0Ldw4BNtV4lWp
	TUpjBbRLCBbo0Qhcw9exQhSJX4jknHHz/60BxAgn4DzXa+gRQxxinPsHCjTkVHqu4Niz28bKR0b
	H0mWEMpAhTPxJlvTfXxG76rntI
X-Received: by 2002:a05:6102:1a0e:10b0:6c5:b556:6d50 with SMTP id ada2fe7eead31-744f6727359mr807945137.13.1783584015118;
        Thu, 09 Jul 2026 01:00:15 -0700 (PDT)
X-Received: by 2002:a05:6102:1a0e:10b0:6c5:b556:6d50 with SMTP id ada2fe7eead31-744f6727359mr807921137.13.1783584014696;
        Thu, 09 Jul 2026 01:00:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm5107062e87.32.2026.07.09.01.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:00:13 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:00:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: unregister CAMCC_GDSC_CLK
Message-ID: <dy7lb5oxp4q3pig3hpa2c6ph63fbengmniuff6a2j6oyf5cust@3vzqk2w5pb34>
References: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NCBTYWx0ZWRfX2FeBsa66BXpw
 vlctWRSEUnt7uRKWXkCDK+xr11mGP+HZSrT4eAK4UMvT0xrLY5Pj2fG0TmHwfNxTz3j9THZ3sIN
 WLCkVhjWJExozgIQdDHYpWtgMM/mG4o=
X-Proofpoint-GUID: 27tM8Q_kkoEskXwaDG_k9th4bfRhSpvR
X-Proofpoint-ORIG-GUID: 27tM8Q_kkoEskXwaDG_k9th4bfRhSpvR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NCBTYWx0ZWRfX/kwLPHI0xhAK
 N8mj+M9bg+Fe39zIhBK04HoU6+PFA9NKkeCsV1eALZA/Y1Q94QP8SAOiL7FlM6/ffr3RaAURWku
 MqSW1+suXsuQT3SaKB8JMWRjcZjUfFr2J336psXFjkPH0s8Tj4ofwxy6IuLYX90E1oVGzNKlpLY
 NOTQBfPNoyqFtZSp6Bw999Nj2D4qY8/v3U4AviRE20I4Pe0I8MnsDbJD/FaGa/V2MSGAOy8E/Cu
 VcZ9s2KOQQ1+FIqYFMemEelAgf2uLrU53gfVaHWPHhBjHeBtiB2PMnIyhgbF0QuMP46IyTJif2K
 bvZGzrLPsH6jJKlSxNfWu41jC7QodCaz7rCfPzyVGXeOvVoaOqJwi4e8vvfIlD8b842++GIhIyc
 igyOtYuS7MPh1R4xjMN9FN0eWEOVXOIuMLIyDricukaoMtaSxLNFpexZsUK+7eCDzFQcCIRJYPZ
 ghT6SzDtnFqFJv6R75A==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f550f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VuFW3N86aykZV0Cky-kA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090074

On Wed, Jul 08, 2026 at 06:30:06PM -0400, Brian Masney wrote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
