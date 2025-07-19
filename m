Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BFD2367B9
	for <linux-clk@vger.kernel.org>; Sat, 19 Jul 2025 08:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752914586; cv=none; b=A4slrfLSfZXUdZBhM19HM9+bcKFVXGUx2qGb49JLXhdtiTDdlrLRYVA93uWnI1HqaudiCWkwq0Fae7TNW1gJUmCS5gttBCgJ5MrA8WJcY86lgFLPdx+rBXtsjVoSdS6WFBvBV+soU/O4gtnKFtJnwYgpkq1/+CcHqNZ+TFSCQX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752914586; c=relaxed/simple;
	bh=7iN9/WrBKY25iKx+cwZ+YxYqzk4F14RrKVxydDAyfcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmRtQDMF/BFGATmP9/y+TS9Az+1MR1E4NIn6BDhf4Q25SgKgVliArQG4e1GPSg6BsIp96NxPF0Ml6s2Z9zlGJvqmoaIC0Arp4vFKxzRadY/sCXVbmhuNF/mhljq8bpr0FSUKPDfnhQZHdxtk+LPTHqrOQTkY3cmU0jwrZBTLXRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aumUsjPS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aumUsjPS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J8HBs7009294
	for <linux-clk@vger.kernel.org>; Sat, 19 Jul 2025 08:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+hnvC71NGCDaTEDlHwH2F+79
	X5DpGLt8T8Ke/VwrdV4=; b=aumUsjPSYsYh7JHM04fduprz9eo9a/rcbnLWUMAh
	UABO04GkBiQfvJwEk9tjuTfhFZBc3o+qt6/SrO7+Crsmah+B3r3vX4bYgphCLqBk
	BZqBZIUwuYCszGWq1l8UOhAMi2SPyyXji2okom/U2ZjBZbv85jliWQeF//r0xKp9
	/ZAMRMOWIb5j93TskW5eV0LYVaPbqxzrxore/6zgzPnYWzOch6HSVYJa3/se11bf
	dbqBLYVw9pZB4LycMoAhJDCY7q7HGIgd8i8MYh35Hg2cujtPCn9ImbzSLfdF1wNd
	mw3xOtFMFCb41izcypdp44OrmSYXiTraqLmkCruYNccDFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044f8c21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 19 Jul 2025 08:43:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5bb68b386so764731085a.3
        for <linux-clk@vger.kernel.org>; Sat, 19 Jul 2025 01:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752914582; x=1753519382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hnvC71NGCDaTEDlHwH2F+79X5DpGLt8T8Ke/VwrdV4=;
        b=Rplu73V6ABtJBEWJ7fXeBbhCCvJvnD2u1X1uLlF7x/S+r0F4BKZYCQs+jd1Vjb8jlo
         UxRtXc5KY7QuSi87QmBF/fP1pLlSKbvQtPCfpv8vd0g4s46sL1eGCtRTJWn81IwpcPbG
         flUFZA/5Nxj0Iu8Eny0e/0TnwW6qWx9Chq/XMQ147vGmW1aw6dN72vRbXK8P+o0wIkd0
         2A354rVkkGoU4gRjd2/M/FxB7wyWst1xVAycXqonPIvR4GyyLfqjUNwrVrEBH/koG6IT
         rA+jeKx/sLfSvDnK5hzQurEFuChr1lazMt6+dqISP/2ypWgbQNk1MJqTEtk0/2vEEsNk
         XYXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMRSXEXQT/PcTfJEd8VL5TSu5FKLcRx4GsgfUuHGZMt/jdSpEvzvtGsmkwDki29smMqY1slVzyVr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpDjyGEQe2Xb74WGHpDvoucznvsgPEoJkue2mks4HQJg3P/MDN
	yZLkXQEzlkGVssWdtvHf+t8bime0b7XEUzazb5T1lh/SkBF906OZv2RTJWJuuaUqM2bmzi9DVlq
	61EMudxRpgh63yfCYcpwn5vVh+t8pUJAo/z6Q46Ntnv6xHyi+XDFQ4vAK8QvRAOw=
X-Gm-Gg: ASbGncs+9986p1mXSySKVshKT2F0UE3DCpiUMIhJRVoZp7mnf3LOPS8u3oRQnkrq/sa
	135/Nnn7nmPK3C61GD9R8KIvvzDftM2pd1ev7l/HloLDPejNtZzRZOHhMOX2F2+hIOrRYy7RkYf
	RWyvKkksmgRPiGQkpus3gqWBeW9vtmkAoHAers5Wm04LH6FdTIXYd2P0/RZzyAwCNbMBPiwd/+M
	ZI20CWslt5kd0hNg14giCqmrxDbCUjZ1CjS89xEIyUfLoanOZmMetAQn6t26AA3PPtGSdm/WHVP
	MGWr4B2RY+xRGbN47xA6Z+GQOMgaG/KkhPrMV+OqVrE2gRnSO1fU2UozcYgW0MoROoyHDF8J10f
	5TW7xTFu8UTqlS4D+2eLZdLhqy3d6lPce0YnrB/O1gCD/c1cveulH
X-Received: by 2002:a05:620a:1909:b0:7d4:38f:a7b3 with SMTP id af79cd13be357-7e356ae1a00mr764033485a.29.1752914582266;
        Sat, 19 Jul 2025 01:43:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaL23hIhZB17M6H1XzM5tH6etKFp/euLYf8xiH9hxUCYpIqAx2BG9Fx6g8LCbtyU3x+HRyKw==
X-Received: by 2002:a05:620a:1909:b0:7d4:38f:a7b3 with SMTP id af79cd13be357-7e356ae1a00mr764029885a.29.1752914581761;
        Sat, 19 Jul 2025 01:43:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d911c9sm623429e87.147.2025.07.19.01.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:43:00 -0700 (PDT)
Date: Sat, 19 Jul 2025 11:42:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
Message-ID: <fmehneccbfrtvr332o3z5qo4wduha4i32c3lf5vixcbskeioll@7ax7pupvdcnt>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
 <unwinuwoft6sfczcjlqq5kijss3ttggfbobs6ydw5c2lkmndc6@7c23jntiprob>
 <1b385a59-5461-4c28-855e-d2379c2a8173@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b385a59-5461-4c28-855e-d2379c2a8173@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dE1P4m1XLNlwoVPv9eAthdF9BGM2FGtp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA4NiBTYWx0ZWRfX772T4V04HYNA
 t8FaY+J0l5VSLQStoTVRh5GQxl4HsyQfDFNm3WREjf8Df7/k4EKME+JMkrtmt9aw1rRxblhorjU
 m9D3zJofu1r7ZNVp9HGrqlBHk4Rc9wxYYEUHVD7IaCkEmPDuDQGCNnCaDqKW/2VzmFzg/qzxjAh
 UfGZPx0+WTxiKtm3KF0EcauNjqsogJXRuW+0RIiucksIDLtuW2Fcg19OJOMs8niXKDsAxjy60T1
 ckuI0Omvtxs1Xtt2dGXYemty80PEkAj3GJfId8x7N5QSzkHzoP5DwcmVyFbmF96Qbdwij5v5WIW
 sMGQm1YYv/4MjZyWJkFMBV2hmaDuoX+FeyecKiqNuMXDXqjvL/Kbgdg/hb++zCywuAD/U+gAsl3
 /V+O8sqhFMTOoEHG7WKElQvHsfbHwXizgAOCZIE2GW7CpFgteW96YuHbg29RudKSLBoUPfuR
X-Proofpoint-GUID: dE1P4m1XLNlwoVPv9eAthdF9BGM2FGtp
X-Authority-Analysis: v=2.4 cv=YtcPR5YX c=1 sm=1 tr=0 ts=687b5a97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cjBuAn5bJLGjDEKm4m4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190086

On Fri, Jul 18, 2025 at 05:16:56PM -0700, Jessica Zhang wrote:
> 
> 
> On 7/18/2025 2:13 AM, Dmitry Baryshkov wrote:
> > On Thu, Jul 17, 2025 at 04:28:43PM -0700, Jessica Zhang wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > 
> > Please fix the patch subject.
> 
> Hi Dmitry,
> 
> Ack.
> 
> > 
> > > 
> > > Add x1e80100 to the dp-controller bindings, fix the
> > > displayport-controller reg bindings, and drop
> > > assigned-clock-parents/assigned-clocks
> > 
> > Why?
> 
> IIRC issues with the x1e80100 dp-controller bindings (i.e. the reg bindings)
> weren't being picked up by dtschema because the x1e80100-dp compatible
> string wasn't in dp-controller.yaml.
> 
> I can add this to the commit msg after moving the
> assigned-clocks/clock-parents change to patch 3.

Just explain, _why_ you are performing the change, not what is being
done (this can be understood from the patch itself).

> 
> > 
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >   .../devicetree/bindings/display/msm/dp-controller.yaml    |  2 ++
> > >   .../bindings/display/msm/qcom,x1e80100-mdss.yaml          | 15 +++++----------
> > 
> > Split into two commits.
> 
> Would it be better if I kept the compatible/reg bindings fix in this commit
> then squashed the assigned-clocks/clock-parents change with patch 3?

That depends. If these chunks are required to fix warnings / errors
after adding compat string, then keep them in this patch. If not, split
them to other patches.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > >   2 files changed, 7 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > index 9923b065323b..4676aa8db2f4 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > @@ -29,6 +29,8 @@ properties:
> > >             - qcom,sdm845-dp
> > >             - qcom,sm8350-dp
> > >             - qcom,sm8650-dp
> > > +          - qcom,x1e80100-dp
> > > +
> > >         - items:
> > >             - enum:
> > >                 - qcom,sar2130p-dp
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> > > index 3b01a0e47333..0e699de684c8 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> > > @@ -170,11 +170,11 @@ examples:
> > >           displayport-controller@ae90000 {
> > >               compatible = "qcom,x1e80100-dp";
> > > -            reg = <0 0xae90000 0 0x200>,
> > > -                  <0 0xae90200 0 0x200>,
> > > -                  <0 0xae90400 0 0x600>,
> > > -                  <0 0xae91000 0 0x400>,
> > > -                  <0 0xae91400 0 0x400>;
> > > +            reg = <0xae90000 0x200>,
> > > +                  <0xae90200 0x200>,
> > > +                  <0xae90400 0x600>,
> > > +                  <0xae91000 0x400>,
> > > +                  <0xae91400 0x400>;
> > >               interrupt-parent = <&mdss>;
> > >               interrupts = <12>;
> > > @@ -189,11 +189,6 @@ examples:
> > >                       "ctrl_link_iface",
> > >                       "stream_pixel";
> > > -            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
> > > -                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
> > > -            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> > > -                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> > > -
> > >               operating-points-v2 = <&mdss_dp0_opp_table>;
> > >               power-domains = <&rpmhpd RPMHPD_MMCX>;
> > > 
> > > -- 
> > > 2.50.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
