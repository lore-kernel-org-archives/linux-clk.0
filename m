Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109893115B5
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848405; cv=none; b=u5LswQKagK9wkSu2e7TGe9xiYRC0egj9UM8f1LTwjJodaZz4GCtYT6U77lIb3W9YMzfOgw85c5M8xl6yvkpto8M7NQcZpwMfhyJgU/7azLyEbm4SYIxtIwA2dN/LFmGXcoDu/VfEiVm9QtGWdahG9ta1ZO2r3KbnLc7pujTMjCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848405; c=relaxed/simple;
	bh=fq8QMgxGO4I1bjwsFUxPjh0/fYBLSgr2n/oC9r9H/4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sg7JLP6xi1wKtNNdFrSFRfk9pN+I+vSHc/LAIq1ASFQVUHXFxoMaSnh8WTJyIF/SbnyiE7aN+BNN/YVLp7ztHFw6+Ktgn9O2g53Eij53dToHXCaZt53pgiqJUgwkpUzs9nAvkUd8BxwlfWtG3xyGGf1XCXr6gU5Nx4TxH8LTisg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7Qc9Gzq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gP+04dEW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7Qc9Gzq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gP+04dEW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXTMH531893
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7PSEs4PQLk/CUQtS2pu7HepYiSKsXDEHL/qILTq9dE=; b=g7Qc9Gzqv7FTuSVV
	sx5RAE1TLnpBzhaV8WNbGJTH+G426L1AjdZhaiBTjFyHjYTVj3iof5a8Rbn+UsPr
	1cLq69tAJB8S5os7xGHoAR26JGe6g7Fzg3fcoW2cF/ACthdf7BGy6O7QIoNp9dOh
	rwuzw58pQX2PI4Fs0j2za/no/mXbJPf04h9BPRgpIf560jhzeV8ontGzssoqEKP6
	ou6PRFqyJaqmyqNXVMP85bOrSxEvABpgSGlEBOstj4elQBd5yE3GO+M0aU4Em0df
	aOZUwoxIIs/bYcz4PvxyOxI5EzhhzsVBh8NnD5rRAcmslFWWcxpDoZ2eOhVO1Wdn
	wQ8vAw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g37k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:39:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so547296751cf.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848397; x=1774453197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7PSEs4PQLk/CUQtS2pu7HepYiSKsXDEHL/qILTq9dE=;
        b=gP+04dEW3hiGVt0YEHlhNPr9J56n6jFkbmhMZmTUFBNJi/rclI6mhAvjshhcq7Anfa
         zkeO6g4GY5CL1oZifnObN1IcjlN/aL7YU2kSS0R6ZhvAtxQ4LnKYJwNfT5ceTFbQH5t5
         kpiDH1Twr8qmnb1OygNgKTmqI0yNFaaG0Cquz+lbQ9jE1eTPXPbV9TQHh5Sy6Mlp/92j
         5ZtyCEU4ysccJ9xiR0aukBHkWMifH2DpqrsSP6SAOroeOw6clbvRRATzf/JB1azV5Mxy
         XaFhhSdYgxnb56f/t08UY1PnHna2fgzTXGr+zfdG6vxUlygx2y6mnd1UGbOKdwSerosz
         kF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848397; x=1774453197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e7PSEs4PQLk/CUQtS2pu7HepYiSKsXDEHL/qILTq9dE=;
        b=V6w0tuWuUAaE6LbGu6gOlFLcSMh4AQha909Q1Q/56uj3mEj2iZ/NUvZd7XpxVx5kNp
         UlXQ9sNZGOJo/MCrGhdnlw0yF+nXlAb5NKdfqZK/mxGHQcpLV/XEnbUMtUywOYtDUzt/
         99xr3IYl7NgLPnv4AP8V0vbyQZJ26wNoQk6XFCtP9kwzft2SifDLTHNmzfuy6oyXuEBq
         KqN+hT5ZcPTTr0IWd0XO77NID9x4oRM0xnjX00nd8VH2SLUagVkV++GdwHij3hn6rG5K
         IaK9h1D78iGhuzm+LvOhbxbdwLYuPKFB+PZUPJ6bc9KaE7Kn7sG5/nu201aFvalHm1L0
         58dg==
X-Forwarded-Encrypted: i=1; AJvYcCXhAz+pr4EDnZFwtX24v9Yvu0CbgdZG+0uyErsFVsoB8vpcb6A7IeXDK5V9UZJtNiqezdjXztrHNgM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0HwKAFy7xv4SMBg4NyOXtUSidjmo1zZXUjl2r+72rKvryxtcW
	zmSi12ggmWmjCur2M9RBYyYOZSIRA1M/+JlEkSDYMJxsxKxIH4GCo3uEDiN1tVedGsg5K/LadpI
	KmLuhxGjlbhRFSngS/YYFUcJir21EBt+2ONbetjUIR5otZ9hR9aH5xwp2pRAusrg=
X-Gm-Gg: ATEYQzzk3AQjLPmfAjHRRjONuQhmh5A0W8wPS5OOHB8cC9x+Ybr2zaY6rxLBad8Zo3c
	9hmbxaSCWO5XZV3ETU8c/cwNB6f7JkRNW2rwTsSFviSxupPu/uaPOOm2qo24FUMRIEDBNaPn5YX
	iNF1Olw0TzsyRIMacsvutZ+itFcwH2Q3VXEyz6eCYLrFOyo3WLaTd2UuOekx23R1Qh4Ywz4T2Od
	dWuG6HOuEnYaXQV6d3df9V5foL2n7GXytJEgGJDZQ/0jTeeGnlp95oQlD+nyHMdDjbEl6nlPMva
	rI3QO6/vf2CsbsJnJujBABoa5ySDaMJXedQJ54KrWXLiceNay/TdEd//zC8hMJZFPPlaPMVvzBD
	6WvRH2AvZBt79Koz+9J+uigbhNjw=
X-Received: by 2002:ac8:7dc2:0:b0:509:473e:2a12 with SMTP id d75a77b69052e-50b148a2691mr46167541cf.48.1773848396965;
        Wed, 18 Mar 2026 08:39:56 -0700 (PDT)
X-Received: by 2002:ac8:7dc2:0:b0:509:473e:2a12 with SMTP id d75a77b69052e-50b148a2691mr46167001cf.48.1773848396367;
        Wed, 18 Mar 2026 08:39:56 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, daniel.baluta@oss.nxp.com,
        mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
        Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Date: Wed, 18 Mar 2026 17:39:32 +0200
Message-ID: <177384710701.3709943.608237959975537642.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260212235842.85934-1-dakr@kernel.org>
References: <20260212235842.85934-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69bac74e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bTwR5g6i7njH7xachKcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 2C9f8d1NNg4aigRGnVs8xUDBGxVfwpaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX0Z7w6A+yH9hf
 jqNVcnjObAFp20jDGlPB/hDMBU2q8ud+MKuOAIBIWCrwal0f5t3ZgVAJxqX/x0oauVbvLSu4GLJ
 CqVS3Eqhj0i97plnXKs/VuUViEGr3xATcw6t0mJdfFvaMYQCLMkeKcEUrXFXf4b5Wq0KPCDbrz/
 dizd+Xc1HBDt+QMHR+JYrltTa4bRQJRJbg8yKxN5GI19s1mIJ/GOP2IFSTv0MfrMbkendrsK11T
 eh2vUBsnu+NDTw36KGYTVSofLJU7je57Jjr+IbaLxwoMHtXSnF/25QGmphBXGSl4b4oamFCuvL1
 tZuex/mpem6QZwu7wqQTk6y73kvBGKBpiiWP0AwKbzdGBrc/rYKaiYkZ1op0aW+IMqPnwF2GVhC
 f3M5Ymqw/9bOttx9RAynVTB8NVfCtompJ16rkGQ+KzLMRyG0ywrx5Q9PkfgDvsf+dSCpxCFY4ar
 qhLIpY6sF0/gk4ncFSA==
X-Proofpoint-GUID: 2C9f8d1NNg4aigRGnVs8xUDBGxVfwpaa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132


On Fri, 13 Feb 2026 00:58:11 +0100, Danilo Krummrich wrote:
> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> called from IMX driver's probe() callbacks.
> 
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
> 
> [...]

Applied, thanks!

[1/1] clk: scu/imx8qxp: do not register driver in probe()
      commit: 93a6d39e78bfa78b2160621aafbb490e063f12d9

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
