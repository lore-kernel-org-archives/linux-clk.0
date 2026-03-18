Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1303CD8B4
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848410; cv=none; b=m/Pev1Q1AXj+UcJcxZOIBmA1ab8fGj2AXKlU2ckUG7dtY6HXCk3fJOYYEuE61ju+FDR6Nzv6l+J3eID9NVqOdCKi9h8CcY60c3AlDHZpYvrf2ZrjvElQdTt0bIfeFyA3nZroyBP/pqYArS9gyAkukYFNH6e5m2ZTAtPaFt/5pmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848410; c=relaxed/simple;
	bh=etlvi7VppNWudklM9wkWSdhdTyXN5ATgjkc6GZjzD3w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DCUjcur6T9IO69DOyVhC1Oei3xJNt4/V/zEAHqQpsLCUOJk0skY23J5vgmoNmEVOuGvlNGCrvzk+GAtrkUBkeEqZ4ajdmFHqAaXUu1hckmv1K7p7Y2frlG9+MoZKo3d9kpf9iTE9BH44ThKSSZNwRKVM8/Tf+GAckoKHey5Jnu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHZwafK2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9qzZm6c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHZwafK2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9qzZm6c"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFWvuV894367
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkpG/HvumoM7VSFgVTUWwXsnalVqOMe13PJD+6yY5a0=; b=gHZwafK2fqZe6A1A
	RenqkFxqrnvaEhxyKxg8553lSwzrvh4ndksR1PpSdRB9VMQVi6gHgo2i2QsbDJVQ
	dIeIku9M+snfI8KcbK4CggJ4nkO5ti7dZly5zp+29zd35Nuf7G2qsrFDPhVf2YZH
	4dg6nILB2kXxAHAeKOjkfgd5wdj26o3t4GGE6MO5nzx8TuD6DNRUwZYqzyG2u47Z
	RNTabnOowhP5r7FzITN6rF3gW0ZdIbVqwNg/eRP9le5x4/LPNRp7uYmRb5vVf29R
	RpXT+FgadWUF2MvS73fjNwASSI8s4GGYBfw7sSO2Zt2ab9Pvk6Dgg+TKJ3EOlKL6
	gNJIPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyrwx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:40:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094ba09affso24092851cf.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848404; x=1774453204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkpG/HvumoM7VSFgVTUWwXsnalVqOMe13PJD+6yY5a0=;
        b=c9qzZm6ctpv0ZKYqChmeBJma1GHVehnI3XYHYtSiJwbI21aga98W20j+/fN0zOXYIt
         hXa/1tHi/vMNWYFPJKG1ogAmdo9k6hHVnqjcj6/8aNgoZT+OXf/UedPDEA0BMhdkmkr4
         u1Lhs1u51FmVF035e9ArjR+Wsj0Q3Iu9H23iWUygeiTqBsm4NQpOuUvMd5D+tNyvNAjO
         pil0EHp42FOBnQ195kMqt9hnmnATFRHmgRGsFKGrqkT91I3SYNZadsB9ZcBTZ1vwkcaD
         5mugkGiylCmnsTO83va2TokIpURcrexVkCD7EdiBZesHRt2hVBhEdxreAbncPyivKRlR
         m4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848404; x=1774453204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UkpG/HvumoM7VSFgVTUWwXsnalVqOMe13PJD+6yY5a0=;
        b=QzbIBs79omuCMX5bcq+g2o2Z0wjar532PuTp7R09LegiTMeweijCBlpQayRDyR4Dph
         krOvnPdIGPpT9xN1noqWqJyMexTR6nqN9N9xUcDDq834ff4QQS/jLN75l0CHsImiFSTD
         XCtPlcaWfMRn2z/zpJ/m4otE8lDI8nMe0+DSvDuXq4Hufu2dXuAriMYx0vOCCIZzN1Fs
         W4MJbsCudfzx2aYj28MevdSlNucllQWEwzcJ2K7Y6Vhvd6cOnGFIg2FNVpeMkkWDztx4
         3BcywutGMed71y/qLEFihtg3jmcGv6nyVJ9DsmZnk8Z08x++EXrx+XubZYdny07E08ex
         jN0w==
X-Forwarded-Encrypted: i=1; AJvYcCWVkiPNMAaPO90B4uOwonHMOZMfzTYLB1KInOgVhM1CRoem1MLpoBhfsTJu6mTLlHQBNM76n9wVKaM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/VfAY4x9EqSASfBSxIszjkStD/+FbDYPiGvHnCk4E1X3EjNH6
	ksFH+gld2uLsZ7vV2r87pUcyEre74a3jZ5C+PEvnXSdjuD0GkjCgJXi9CUvsn9wuclAAMeCj+sZ
	/WFthQzi9gZgQ4FQvT6KImEwJqzS2JssXA9mscj57tTI5W61Mso+SGYt/jfoI8iY=
X-Gm-Gg: ATEYQzyAh26AXgwj06vx3n7PHEElFnjgw/rXnJ+x0pQ/cDFxUmHdoPhWLT7I5Qb2tki
	KZBfzDTe8D2RO+9bmvDUBNBTwKFeQfbOCr5+IiGg2ZMXa0oN0jBChqlGSZVOpbzissvP4yhohfS
	5xrgsLYmqc44AueMiVuXLJfNo6ARo7AlgJ07FR5IAMSGTChTxbOSM5dEl5fVxiRRgUnsNAQJzUo
	UO9Ayx6vroTxUmJDbm5PrWKBoaXJuz3DKsqCWVy1KA7kRg/tReUD0VDHx4n/vIzdXrhZfaY2MN1
	KSWbYKVF9jKiEgbfLNuvUj02yfacg76Tr54HJ4A/vvy5G+GOuKSyk06OoR79Vhfv2mI8ac+UGGT
	r/bgQs+2Lbyk/tADWHaXlE22E7N4=
X-Received: by 2002:ac8:5f4a:0:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b148c2951mr48098481cf.48.1773848403697;
        Wed, 18 Mar 2026 08:40:03 -0700 (PDT)
X-Received: by 2002:ac8:5f4a:0:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b148c2951mr48097811cf.48.1773848403049;
        Wed, 18 Mar 2026 08:40:03 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:40:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, stefan.eichenberger@toradex.com,
        Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH RESEND] clk: imx: imx8-acm: fix flags for acm clocks
Date: Wed, 18 Mar 2026 17:39:35 +0200
Message-ID: <177384710706.3709943.8065144215162763896.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260212085750.3253187-1-shengjiu.wang@nxp.com>
References: <20260212085750.3253187-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LMs0Yv20rNAW44iK8-M_m79_aKcpR33v
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bac754 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mEXvEbR-UhZ5DZ4btVcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfXwU607QSmNn9o
 I1D0I2u+SyXBK8ZkxMSWkfZIcbq1ly/7OMfVn0w8BBJnhoWahdkKPlRyy/pYABeGz94a0MqQVdc
 SFj5JXtFo+AcJgTteM/uhx/ya42nRAEf8wc0j4QTGipcZytYqcFkcZbXHdvDJNvO/pAKHHuMGsw
 201nrRCY6uDXujTOOQtDfOXXmmc5nGYxVt3h3OqDyocYnZsXnvs3itAt6P5aVPYqHjTxcdFNkss
 nAoGuoESvCf2Xcy5kajNERT4kiyEblNsebcemWFQmLD11c1//96h1JaDdkBjznJl/qKGjbVCk21
 rFfd0JC+gp54bR46kNA7TxeH1bnn9Cmobs07NhRNPlzA8FqIx/naZHKD8LXB8d84+Pv0k+5vQqG
 eo2GrbIcLLdjupRlf9HL8VN+ag1u2l0cyIfImxF4HIJ54mB5MaWywIbGve2rW+aa6y7iQXcmB9x
 S0BMe/k4MoTPTPggnsg==
X-Proofpoint-ORIG-GUID: LMs0Yv20rNAW44iK8-M_m79_aKcpR33v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132


On Thu, 12 Feb 2026 16:57:50 +0800, Shengjiu Wang wrote:
> Currently, the flags for the ACM clocks are set to 0. This configuration
> causes the fsl-sai audio driver to fail when attempting to set the
> sysclk, returning an EINVAL error. The following error messages
> highlight the issue:
> fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
> imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8-acm: fix flags for acm clocks
      commit: 01898eb94e4e7b70b6e89f874494cc18f4954e1b

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
