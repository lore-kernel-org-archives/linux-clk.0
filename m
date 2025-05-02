Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AEB20766E
	for <linux-clk@vger.kernel.org>; Fri,  2 May 2025 22:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225813; cv=none; b=Ly+YC13Ett8z5YFMUQdDCnJR9yLJk2HsGtqa3S32m1I4VroaHE+Ws8r6bcewp05B/BPSSQJfrxfesIeoBPdL6L16YmSOuBFw3l2l/e+3eosemqZegCxs2UwALc6rBJWGt11HnkC/TB7g2fPhOqgbP9nOtI17ApFCbyyLaMF3Nlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225813; c=relaxed/simple;
	bh=cT8nC8mZfOCD7lTXfvpIEpKdy39UtRQgSpJDhtuMs84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVDYx+o3UVi9+bdlELbFQTYaGKA1CzlcI9P7+zPOpm9qcvAgfWB61mBU3soLcgycXsb1NJBpHGAZcm8ZoCYOzuJa44DmQwOPHZxvFy6qs+ECUofrWx9ntb1mPUbsJXIuG20kq9JverfXstSKCAvVagBisBM3UPZm8qmgexjNN6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBZRc5D4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBZRc5D4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAxmb011525
	for <linux-clk@vger.kernel.org>; Fri, 2 May 2025 22:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CN7xAI5RxauZHSlfvB2dYCQh
	k2oKQHJwg6cw+tFAgxI=; b=gBZRc5D4VtIwHTesw8c96N0We8YMT9B1/H4e/S5U
	3oYIKUD8+rjDiCJYS++0hTrSNHQW/yllkOhaeAZk/5CFoPZ4d+MT8AfjwirCgHs6
	keSX1ZnmoOhr/N229UAKoi36p9S4gALDRHCM5wf8i56AOMMRFKn3QibqUPe4liG+
	jtBYahA/Kus2Ldh89xMnaJmhQ2eGqVwNY0yf4LW4/PYI0AMLoeZuXcfoFjbi4fF5
	a9wuRCyDx0X0IZmc4yZX0XnXFyjGine1RWPxsnS5iaXVv4KoIJIedI5EEcgWJqTt
	Nf/GOisGHzNcLKCwGaqC+IhZT6Mx7orcvLEihyJfnaPuzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub1fpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 May 2025 22:43:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4768f9fea35so64267171cf.2
        for <linux-clk@vger.kernel.org>; Fri, 02 May 2025 15:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746225810; x=1746830610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN7xAI5RxauZHSlfvB2dYCQhk2oKQHJwg6cw+tFAgxI=;
        b=D6n3/UrRBDmOa67xqWdj+t6oOeSAJI8sdPrmLnbHNfFcNg4Ezp4orY3fmoNoRMFswl
         Yu51c9bNaW0B0vAsman2Hz6xxleEb2Gxy/XUJP+9anffwTYZxmglrpojii2gkIDsrRt1
         sR7F9guIFpObYOadL4GfY5wn3dGAzqXLGKdpzAuVo/aHfcMFTkkpMZ84y4UkLdMQsBKf
         5g36ATHMhgMs7SSkOOBkbWhPkZVjtcMoQaLFlR3z6RukNjgbhzbKqPs6j1xUcJDFczB6
         QfoEGSio9m+Q7h6pCZ8qauoxF1n95wBh3AJopVBU5Gj1fD6BgiSfoXK7TWtEKb5273+2
         Nq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIU643IvNAv5/4NR9I+mzDrws40o9cZY8EYXEb+I+8GXiF61UQxziD9NbpvrRzTpsTrskwuXe+Q2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD3U21pfrdCwWPzYAA4G0GJaGu+NJ7sK/+dLqgszy65t0DxH9r
	U+u9GKFAiaI9BW1Qz3kNa9KTQx38E9Rp2HK+GoDYNTutZZ7a3zJkuTejjKv9RuEFK2+yOqpjv6f
	axVsTOuHzyd0HnGcAvUVGplEIH+9YiNqO4GrU+mgi6yF7UALmoSA2T/BoAt4=
X-Gm-Gg: ASbGncthvMrxk2VIA1J/sNGaJKTBndK0aSdGEv+4HlA64Wz9DWIh4vZ1i2qZB09xpAQ
	OAU3RZyxQ2EwUsXHqeYoYBWfjLNM0iaURxifWpdwan+FCCAeef5A8GlRLuyo/2x4zUJwS0csjNj
	XPVER/xMS39gwtfgv1Z+ayHBw1KbJx9CyWXlEhCRz0mcz8LmjxbNR7dFScdHr3Jf2eMxonbIjYj
	lCBXUmaHGR2KuQcELaYkaCC5Dqeppf/RvHiDbw1P2hg+IEvMO+lQj4RKDZRM5f3xDFNyItj98sJ
	978MrpTMziq2ul8PFGhrLe4gRsPXenKwcVHTxZZYY9CqMeQ1P6WKac2hnFpWTUYC/sXkB20g8Uk
	=
X-Received: by 2002:a05:622a:5c14:b0:476:b480:e440 with SMTP id d75a77b69052e-48c31a224a3mr79130571cf.23.1746225810295;
        Fri, 02 May 2025 15:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyDC/ycgAmMGrAX3PIpDNuTMextZpMxyJBxhg9RzguKAZ/R/C4ebf5Fg9mF7ewzlpaMNVwpg==
X-Received: by 2002:a05:622a:5c14:b0:476:b480:e440 with SMTP id d75a77b69052e-48c31a224a3mr79130141cf.23.1746225809891;
        Fri, 02 May 2025 15:43:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a897cc6sm5072491fa.70.2025.05.02.15.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:43:29 -0700 (PDT)
Date: Sat, 3 May 2025 01:43:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 14/24] drm/msm/dsi/phy: Toggle back buffer resync
 after preparing PLL
Message-ID: <b3dbtmqigdrazkhlu55r5tzo5w7ixf65m6y56nvqnaetkv6onk@xsakfzc7mmzu>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-14-8cab30c3e4df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-14-8cab30c3e4df@linaro.org>
X-Proofpoint-GUID: c5Re7_EbQkP372SFU4XJb3Jxgu_hORs4
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=68154a93 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XEkVnyDaZeylL3GQtG4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: c5Re7_EbQkP372SFU4XJb3Jxgu_hORs4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NiBTYWx0ZWRfX6MRHqnZHjFDJ qUiLGcKErRz60Kpe3wzl299pKe4y1CDHKxQiuXn4KEyK4LPaUpTH2C1iTulDpc8D3cXiytaUsI7 0TC6bouBnx0cJkr+iBo62Vrb5tKDJvV+l0Ok9VBHPxjrusLW13l9RmHKf88lxxmMn8xToMU/hQB
 uK9RwdmHv7Q1X8Jde7k1CyDUcC3FB2iZWoLYIsGW29XrQYYqd0yMQPN8W7i1L8jQMaAayRiQjCH GtUG1Qd4a/61EF/CGO7jhTMt2z0VqknJXL7x2XhkoYsoHB2gzbk3QZ37w4px8moIXxsNSitZ3xD xyG1RBfuftj0+x/kM4avrfRcVNtF6/MickbK/nRElNVJkieWDVkJBihoqDryv6n6bgAJ3OvOkFM
 FsvspatDJsz4v0WxxYf6iESvQI9Y8T4YD/y+OFPIC0+RkQtHsqXsAzA1LdLgoj9+q98ijlDr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=771 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020186

On Wed, Apr 30, 2025 at 03:00:44PM +0200, Krzysztof Kozlowski wrote:
> According to Hardware Programming Guide for DSI PHY, the retime buffer
> resync should be done after PLL clock users (byte_clk and intf_byte_clk)
> are enabled.  Downstream also does it as part of configuring the PLL.
> 
> Driver was only turning of the resync FIFO buffer, but never bringing it
> on again.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
