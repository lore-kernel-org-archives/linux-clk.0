Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADBD328610
	for <linux-clk@vger.kernel.org>; Sun,  7 Jun 2026 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780828213; cv=none; b=P/majG0yvP3HkqhDpkINJyk7fQwoWBBJbZQeTjTAn1HEvZeoO+tKEdUPNnY4JgTUsJ9q5Un3I5vIj0eElogH2ythqF51TgTUyYlqdBkCs+y0kKkosXhwzFKHqxiCZRAB2V+UICCsl/7qNpBPrcl/1rfePOyAw1HMR6pBOP9QbHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780828213; c=relaxed/simple;
	bh=zUlU+FKCAPmT6i082BqHIl/+eTJQaBXimRlgvIK2VYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKnKhcuf4Ee8e6t9MB6uyig0tqrgskisgIuWKpJIKfH5nUVTF9YK/xRZRumTA3quqk6hLOAfkqy7rCHCeJOuzws5kYX7Wfv5TD6qlazy24b+UGx4+3zVdQsPw3nZHFmPdSPcYBeKg4vvvc9paKziaR/GbgDuof9et2Fk1J14UbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUS4sxft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bP7kLg+E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUS4sxft";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bP7kLg+E"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6577C8wA4124932
	for <linux-clk@vger.kernel.org>; Sun, 7 Jun 2026 10:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RsyqRj4yeF8EzF3oAom759oVpvrvl97v3DGVkUjIWU=; b=YUS4sxftiCRt5g3Y
	Fz8c796DgFs7CdFiOy0IJ2zDmqWXVM/Ly1JwOb5lrvuZw6Xu3LRWKh9i24QnF158
	Gx7xiRQU5xtNBGuGWASFKWFswKJyZZ0zwbe2ndLmrpdwvT5Xu7f9LhgvvA/YZmWP
	WuXcl00hMsYMAb+NTtHy+pldaQs7wKbkOuw5yItfw1s1P9Tb9Jdr83cMPMZvwD92
	MPSg2ik1eHE2Z5X7RzqkMzBRhCrlRyMKmjN2mTIt+1h36UUi5CrEBhBCUjwV2Dux
	OSVzSn84RdXQJX2pinn/kFxlUH9vXo4qr2FMx4YFED9f+OhuUXtXW1oFOWKdCI44
	YRdn3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3kyxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 10:30:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177bddf6e0so84200771cf.1
        for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 03:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780828209; x=1781433009; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5RsyqRj4yeF8EzF3oAom759oVpvrvl97v3DGVkUjIWU=;
        b=bP7kLg+Eu/aEahRBmp+BOMe1Anl8dLKrj2lIRDf+deTxOzHYQYdfLtCPKPcuIMcFEK
         wZbTEtYuNbluHez6ZIWgtsD+0DK8F8lgg3ZBUVF8uO/343djM8ANNf9hQ7wjWmpibmWL
         mcc4gNsFTjnqcJabG/JoNxovsBimkpoR6RGEUordKWTudzwJrac7dDWuDr9acX6MdyWX
         sI1c5x9YLB/ByAp9OOGBb4nunptk9yjIa5RfUHNiUntH5XmwwzYdCyZz9rSFy/Yp1VjY
         /nBxo3XRv+O0jv6Pj2wwInyhtsSNCSRQI1RUiM4AWOo4hyxGP5nfhsxuVAzLEAE/vD7u
         hCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780828209; x=1781433009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5RsyqRj4yeF8EzF3oAom759oVpvrvl97v3DGVkUjIWU=;
        b=HoqmT8ote1+x2jTf+lap2TmvmXazz7WH8Rrjx1KPWLy2rNgvDr+uLPeQgpiLSowV7j
         kWlndGWxcMGRLL4uXF3NGOmgh5glY1kpfpDgHpuTu7r5glCf9ywE15Qm5B9QO52KSK47
         uS75KwdiTk/YMOX5SsVv5Tp5On3Zc04A15SlFenqOUxEXjicGfT7D9cJJBvTbHNuWlY7
         R1vCQdO7rGCvJR+v9vGnnArO0k1zVi6CBlQeC1nabCdkf4+EPjdDbyM/bJO7dQl8vLX5
         YA7lbZZUPQXW4jq7Lr0Hq02qs09KBeW0YEuNKkdkI4WVOiTXf31+dltMNLT24dhAyLMB
         RcnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8o+itKShaQyBN3+AY30sBp0XlVhGpu7S+2P9SVCTCNU2FxHyLm9PUMBgctMFqDuMb/TKk6GnxNB1M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4aRFP93A/6oBrg3PbtfaHpcnHrS1AsseRGIWgyur4lnrXnEET
	jFeWIlJSczi8JSr61/ElqtBjg4cUTOlOE+et5fN185IE3H5FFyqb1Mp8n3lc2JOGtVdsPMuVKWN
	lXhapyWeikpmKjQnatmdGykOlQMxJgg8y7WHS7QYVnx24Il3Z9kd1hXiI7ThVlHE=
X-Gm-Gg: Acq92OHhDqiTKJ5g6SNA0WWfvJ1SGZWm4HX8rCSZ4jH4lRpqbOnaNstmvDSW2o04hGM
	gKIfgXk4roaLFYQ7G0DYakRQ/AysitwjYUwP99/UbXLl65D83MHWrlGj1IADLabRSNncY3/kuy8
	8iuU/KXcLLordroW77QOBwqT+UJmgm0SgBZ5S8eHgc6vok7Yfqy7wtw/WDhbIHskRjoYt4rTbFt
	5NTuRllQXHDYB78C7F7Y5uoUS63XKPJV8EtWKpEsIAkpvcnOMTOXhR1jRbzaVWTrDfYdQTzgksg
	JF8cZegv9pockzoF6ZyDEq6hJbFk1c4jruVgRRYZU0Ouer/vucVHhFsVxjWP/XlzHRQlxPCizBA
	ZWQRRbh0liEj2WbL5CJXZ24l/ilWAzx/8PmbwE85+URAleUvPFYpaIrZ6IRNfvnT2mi0h1cX8jy
	3cWBewIQ7EsUykmC7ffgGJZHMbp946p8fbPk4Ql0YnmuShyg==
X-Received: by 2002:a05:622a:17c7:b0:50f:f030:920d with SMTP id d75a77b69052e-5179881c7d5mr99141801cf.30.1780828209401;
        Sun, 07 Jun 2026 03:30:09 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:50f:f030:920d with SMTP id d75a77b69052e-5179881c7d5mr99141361cf.30.1780828208967;
        Sun, 07 Jun 2026 03:30:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac092dfcsm37044801fa.16.2026.06.07.03.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 03:30:06 -0700 (PDT)
Date: Sun, 7 Jun 2026 13:30:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Brian Masney <bmasney@redhat.com>, Saravana Kannan <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
Message-ID: <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
 <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEwMiBTYWx0ZWRfX18YXzGQ2kZlH
 dF4PFbJ0uhODjTicyM6ktkpIRfUIPmJC7bnUY9Df9slcnR+2959Drr7MdewCZXJr5ZOpeaXKIWm
 0YefPqGyUutXP5DBpziadjGk7PWB34v/nDCA4tZ45PPsxRdthQ0WD+0V2SxmcWa6DP2ggAuiZkr
 TeyrpT9Uw+nv8eDpEhLgyREXArzUkref1QJldNQ2HPl6WeO118Up37jpDM9dKqU5c7dzyfaUEwa
 OsbU070UV0fH1xIP/I9vUZabUVp39Xs7cCT7yv6H7cNeB8tfZRlpPvX+bG6jmMu3U6hKr8YjseL
 AKI+ohusNmwxf9SaXGar7QtUIL7HIQv8gKndRdgEI7LghtR+2HvGvJC5EV7/hCC/sf8YGitzyQ5
 TIE8ssGXGF93tIFRtD5sA/H/h+E6QO5+AJjGZnusGczuZjO3Z2fUtYFvXA61Mh30xiw0gaI/Vy0
 7Z/nFkGC0+ZN42qvYiA==
X-Proofpoint-ORIG-GUID: xFXlFF5czcDXpaSyc9dqTW1xe2AHv2Ku
X-Proofpoint-GUID: xFXlFF5czcDXpaSyc9dqTW1xe2AHv2Ku
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a254832 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=i8ejakjM7bfyIBltOq0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070102

On Sun, Jun 07, 2026 at 01:43:06AM -0300, Val Packett wrote:
> 
> On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
> > On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
> > > Several qcom clk providers currently have a sync_state helper set to
> > > icc_sync_state(). With an upcoming change to the clk framework, if
> > > sync_state is not defined for the device, then the clk framework sets it
> > > to clk_sync_state().
> > > [..]
> > > @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
> > >   }
> > >   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
> > > +void qcom_cc_sync_state(struct device *dev)
> > > +{
> > > +	icc_sync_state(dev);
> > Only if desc->icc_hws != 0, otherwise it will mess the interconnect
> > internals. You might need to set drvdata to desc.
> 
> Hmm…
> 
> Currently icc_sync_state does not seem to use the dev argument at all.
> 
> How would something get messed up, now or whenever icc_sync_state changes?
> o.0

Yes :-(

-- 
With best wishes
Dmitry
