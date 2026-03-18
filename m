Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9045395DA9
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848412; cv=none; b=tT0R6nirRfVfJedK4LlRUPMR0P2iCoqxTx9DOUCjsxksQ1rAQMEPR0hr5+ECZ2ut8hVzC1dMTTSUcYZfT+ARp2nvNw6ja/bgCotBPEH1uVaOxKv/W7lwlYqD5fK3zr7wbqgmnmmhE47n7Iq+d/3GPyqCI/vOREa/vVAhhDLjllU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848412; c=relaxed/simple;
	bh=+/5hpIINErT4GHpCdaeUitMMq2THx5fOFIsg0ny5MX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWiunzV2XRVoKcCTPnS/ky6IdA+t8TuoAMSkFVudNKTuGsWejztE/j9lTUrL3VGmb7bVL7p0gzeia0qlOfhhJshPRHicietFLa5zKeijRfVDC5AzMa9XJGm97f4F7F0sD92I7DEpDY5RQlo2WaxGDw0k2lIfx+5P23aM5AdaMAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+6TkJxW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLhnVqJi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+6TkJxW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLhnVqJi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFWtjX894257
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNFrg2oTUsMQolNA+c8Q1QhSY0+oF9DCXiaDX1qrr+Q=; b=h+6TkJxW8AFM/rjg
	UpLl7MCi0n7hgYiSt0w01mQiOdoLdNgKhX7Go61oZTr/wK0HvrirW5xq6O7IqaqZ
	+rVlrop6tI6KbF9beRhc9/Djw2Ms0TOSL2nGS7zVHAXBoXx/qEp8UvMHz21qDxyX
	kyqgYexel7j44oRfiCIr69gpSX8S/v53ktQOrrBrgaz96NFTSjmv1drIYYnlIqS+
	Ug9QnRpPuJ1PF7nchyG0hrK/6xAPI0LhxzaRJgjkmeWtB7OJEibbSFwbsRw25vYh
	3VjnKlvlCymIhPBjxPTCCLG0bE5hORUeD6J893qtCP5yKZEdmRCDl2I/nZvXPUZ7
	AyN3Ag==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyrwx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:40:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so547308181cf.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848406; x=1774453206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNFrg2oTUsMQolNA+c8Q1QhSY0+oF9DCXiaDX1qrr+Q=;
        b=DLhnVqJimRNMBI8dz0znxr16bAFpe29fJFekF1KSn5qRgA40jf5ImjrE6FhvSVeZ0O
         Q45+lGFnSvZBhucDMNuA+CT8dgAmTL9AyJAzT8f2Mr1EYno10YOursSiB0UUNLycY5XG
         W+watTjsqS+fXCKTF95/FkzwB0D06q24I8PJNUzYxEnvldJz5pEIQ7mQM2x5QVHeCdZu
         tiU189T6pHHLFSJojGK7PcSnKbfjixdtNn5lznxEH5G830L9FJzQ7YtWY9dJIcdxTaPj
         Xe8WYGHBZ6CdOa7YqgbgSIlhucURrJAgC7Dcf3/5vwraveKW9W2NqT40UwXc9vPdUr1X
         7KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848406; x=1774453206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNFrg2oTUsMQolNA+c8Q1QhSY0+oF9DCXiaDX1qrr+Q=;
        b=ijJ/Va7tRM3RnulGmqOJ1gY9Yf7l+RIBMUeJgv87NviJjRvwV4mR0fECOyKLhWa/D2
         G0TGKgCfTxP95HDeIi7FdzwAiVgN4FC/magMOd8j4m2VzZNQzQ3Bx3V0JdXYT54f0IMl
         CwnqMxjLhOn0CzcUQHWkEqmU/tSMwGQJXjN3dNIZhAde5+P3uQW05Tvo83kRMlQ4Nox5
         EWRxbp/tpu3/i+Iz1VZI5gbmLKctMWXZcuFRy/awEF2//3qSdD2QS1W69prhuqddfjSw
         slXWr8BuaR/8MiQ90h1dplNnZdfKboONEDUGV0vI/D+C62jv/KQzWoxMVCtFoKVQ08qh
         8j2Q==
X-Gm-Message-State: AOJu0YwFUyx4HM7JWcQn2apFmVW0Gd9xMzJeXuRx83v6670p9AXNZg+O
	S37ewYZtq5sx3D9XMdFZaoII57zuzvFpOY8NGpco9aYm/DRVcM8zPDNfCrC43v05YwfSIEC1lQL
	vhTOMVOz7cn6hczOEFsBj2e6CUGD5NvKFJkLtZvBoAvcLgj7Jc0pIAUktFmEu1no=
X-Gm-Gg: ATEYQzyMvBXSNzjBFUx+gJPHHgz4qOGY7oNqKKkEUWtamINkJpTLfq2uivHaFGi8hjS
	kGUGrtFRjDZoLLLGVYBBEBxdKrrp/I7RDunWXV+wRjlF8MwiYASakMBK/EWSTjriBs4en3pDUXz
	aftny2gym59L/jThfGQrKYUBlIqywZIiDK6hyQPsZASnh/SIu5iMllAJRhdJ7siXZwZkhXeSbdt
	kT8Lb7p/xnSFkTMR1uKePQgyq4Bu1PY0osXRs4HSt6kKyp3rY39ZwimlwG8Kb7sjIZNss4OPeJu
	RDNJypVdT+Uv/GFjNtO6yYY+ci/gblYShrsGlwrRH34AUdNtTxxbDoLY4fokTypiRb4pkLrnIuU
	tDiOi59ILmQNwX5W068GC9GOjdFY=
X-Received: by 2002:a05:622a:354:b0:509:3706:d135 with SMTP id d75a77b69052e-50b147d1e43mr48218021cf.29.1773848405971;
        Wed, 18 Mar 2026 08:40:05 -0700 (PDT)
X-Received: by 2002:a05:622a:354:b0:509:3706:d135 with SMTP id d75a77b69052e-50b147d1e43mr48217331cf.29.1773848405364;
        Wed, 18 Mar 2026 08:40:05 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:40:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Akshay Bhat <akshay.bhat@timesys.com>,
        Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] clk: imx: imx6q: Fix device node reference leaks
Date: Wed, 18 Mar 2026 17:39:36 +0200
Message-ID: <177384710700.3709943.16185958208428898665.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
References: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PdmHww7kw6Pi_RyvejW1oAVtalGtNi-n
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bac757 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=phyHbrEdMFs6mcJ68IAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfXxu4ZqnlhABE+
 FZtdeBBws8cOKZwGsa8yty9zVf0rd+JH9usB2sFkspkOgYL4KuD1YD6+UNfHEU9qn30N0wGHAoU
 nK6kqZdkUbx++E4OvUoJYa+4eBuKUXptfpDNlmy0hCRjW+8r2ly0d6bWLa5e8q4auJzLuXz+qXI
 MOCN6zokslDUgp4PQqjzSy+bzAqjd0ncy+L3dv66Ai5Dpg6fi66tE74+7Om7HYlNUdikpBcusgV
 tmEJafL7NEEOSz2oPczgt4kOYfjh5Lc2gOyKEMjzUDmnghnzKlpl+gLk3etKK9R6B1jWceM0Hmn
 1br91H+rsASr4Q9LoJ/oTJJPLi9zgahJ+Dw+cyMVx55gjB4yirlaNF/wzxO3ajTdxh476xgSi5t
 ThrBNHiZnydlbLEFYBrnzgjPRuhqUv/0eg5E4UmWEKpCS7ZkvQuoMqo7c3RIgBFuvRY+LOBQ82q
 GDtPa+Y5JfXh06ZLrhA==
X-Proofpoint-ORIG-GUID: PdmHww7kw6Pi_RyvejW1oAVtalGtNi-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132


On Tue, 03 Feb 2026 22:07:56 +0800, Felix Gu wrote:
> 


Applied, thanks!

[1/2] clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
      commit: a35309ef7112818dfcd592f6fe7de182d404c660
[2/2] clk: imx: imx6q: Fix device node reference leak in of_assigned_ldb_sels()
      commit: 98974b292db01d100681bb24c18bb7482e5a1445

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
