Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7E042B728
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239078; cv=none; b=fgmUVmyidNzUxwMOcTpIU9bL6am0NmPt6oCtVdAlafqBjsvcLu2EHSwJugepzONPz12UK2KepvVqOil2deroptoeQWXmubRt39Ta2LD82KYa5g5wMzkzZ9hghLnBGvUPqFFlIz1QNk7UL2umurIm9V8QHPaMnUbgTjwR7kW1FxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239078; c=relaxed/simple;
	bh=SCPlgsP3hnEskVZkHcQYXzAvTGi11HpqtwPxR5Zm4yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VyPWHQGzAok3mBO34UomyGFMBStpID+62vvkZOd5jszYhtgDUZKTWXApCgiS1b/HriayrsN6MTaIMeGrQNYAU5vHXkUdhqYV/yD+PvAYPVdbX1Y5Xz8GnsmaRU8X52p+qR5jsF6YrFgZbiOiaC3a2z7CWNRdCADkc3zSgEBCHnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jv4gHMYS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUaCli6r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jv4gHMYS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SUaCli6r"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHAaO3751270
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 11:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hA+G3FWrRx3/7OkOiAbGkn+XAS9qcZ73GDYscb3Fmd8=; b=jv4gHMYSGE11DGLy
	bbwGnuVgx0f+jXMaPrkNIUcRwR3OOq9j5GE+jwCOrOUndea01hGkW69umTYoNHKR
	x57Di+bYhNmSsKsMrQkvsN4+tH17tf4fsF2Ig7U28Tv675nPEvKvVUfW/RIetp1V
	COyw6PsU9l3wWL96iQbwcCsxRnj/f7xgbTe1PBAJEcYv+92YJkKz8zC42hNT3nT0
	2MO4aFMxuUwW2ODdZamKdWjchQJYaUcTFYsLhTuyoYAtMwAXR/0H2bRXjnzF0Lss
	yEZKuh9y9fmGXHAkSDgi6ekOugLFPXh0M9viTEv/wmyXlwsiAnNiCGQg23xqz9Y+
	i+c8Mg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5m39g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 11:44:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso42076031cf.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 04:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785239076; x=1785843876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hA+G3FWrRx3/7OkOiAbGkn+XAS9qcZ73GDYscb3Fmd8=;
        b=SUaCli6rljBRyypaujCMYamA3QPOljdIM7yJUeZWmzfBcQZfVxBVlM3JS3DVd+H7kB
         6qoTa7G+YfA6/+nLv9i7a2Z9y7PKvy0uoKoyR60P0fyBxY5dffPYSpSgjHINrUmpFS+e
         Y2e0pSKIz/dn6lM+3IRBXABV4PwW60t5zdvgSfjQj4IMYk1BNCScDPlNTnXcxXMOXaBJ
         AUz+oiegZm1Gpv7fe2MJD+G0rWYDJdzx3weUD5u46Uvdvvys1xZPnqppPjZYwkPPS/OC
         VDLJgNOFbeVMrr34oBZeETFLbADLxIGUk2mTAoyoLZfXGKT29cKyAbtkS/vBnRWno4n4
         P7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239076; x=1785843876;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hA+G3FWrRx3/7OkOiAbGkn+XAS9qcZ73GDYscb3Fmd8=;
        b=PbB77IdHCkwdXdT0XHYGLEjtf080MbD+phavD4AfvZJEXVtl/RhIWGac+m9eIepNYp
         9Ol139HKyspjQ1DmfHVj+KcKzn9aacHd4mgtNJInfUUvOyo2JYmd8cke6flCh95u9qFW
         yVRSPkpDb7K+OIArrWLRF2cRVx28ms9bUuY4OZ258+rcvfKxIkMTJLdJkIQJAGTNlZ9p
         md+APh922wMR4J14q/kUAweNnWJ2O4qftY0sLQEHp1FEuwpetbepC7p+DIpRnUZjT4YF
         MPEULO++82IcVyNMp/HBcaLluPhLxXrfCkDdGqAkJ0F6JKjB2Eo+OUKm2MkdTgmj6HE2
         eeFQ==
X-Gm-Message-State: AOJu0YzhXzAY0uokFzFpiVqGbZ6rXDBkpZc/qBeWr3YrFfy8H2cLFu2b
	/UEsDYMpoV8RdIh0AVPxUWUwCoOqSmlknXlBtQrzbE2cJ8paKcg2UDbu17TxiQEKP59+cY4S67P
	Hxiu/3misk/A+dUA71HaDN8C9Wfyf/eqcGNiy25TGhYTIKhxScqWy9ccl+CcVZ8o=
X-Gm-Gg: AR+sD13e+VJktsLfuFxYbI/PYcgdM23cCYGp0AIT4XWXo8x5LWkEqGWl1RRT3PkpmGm
	o4nu8YOCTc+T19JJpSaiklb5Z5TKr4Ged8Tv2O/iAfhqO97JDORjeQfmmjifK6iKXQEjqh6fukO
	Tu+vDV4qYnzYSj34oq0woUf25Pq8cPp/WSgo1eh1SwnYjmtgasjEaZ57EhDbCeUO7LTnfVLgp7W
	LWqX4KhuYL2+YwVD0sx5pmV5uEOZEQqc47RIUflIrXMn8VjSKUlyS8woGyVWwlKLdnrRlyWMSwb
	azQGmMlYV9OowQ3AJwAv/T/64OlWG8g/U+A9swjFzB8ZO08rFK/NuheUSemPS9uILjxvInkODdx
	meOim3V2i6RUols9Dlj41iQn2fhM=
X-Received: by 2002:a05:622a:6099:b0:528:2c84:eab0 with SMTP id d75a77b69052e-529d6febccdmr14880801cf.33.1785239075517;
        Tue, 28 Jul 2026 04:44:35 -0700 (PDT)
X-Received: by 2002:a05:622a:6099:b0:528:2c84:eab0 with SMTP id d75a77b69052e-529d6febccdmr14880451cf.33.1785239074900;
        Tue, 28 Jul 2026 04:44:34 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46160dfsm68407265e9.10.2026.07.28.04.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:44:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
Date: Tue, 28 Jul 2026 14:44:10 +0300
Message-ID: <178523892597.3206426.9839796050090970254.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
References: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX5/hlQkA8uYTE
 aFznpuy2wLfGsy7ljVDITU+sETlGfw7DriTxVQwrCaTfDJ4vdo+7PbbHZRMxwEC0+WP6hWACs/h
 WH7KGOXn4ROdGPLRAydALmViHzYGwIE=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a689624 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_ysCb4Hr1M9gRo8ogBUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX34PGZaxjpdqt
 KrTD57b9cgIcb8JrQg38RdNRSG1n62vit1EUcNPZCZSasSVPF80KGE0S+ThlUb38hSMaGUDtRuY
 1XBOLMmvoUppRJ1uJOyZ34jfLQLccFSQ1JyLV34hQ4DWZpp1Dri4SBY5WX2v03XxAjZWI3GjtVE
 G8UJa+nmfvXXFTSu8Neb+6DvYeQPvsT2TQEjxYgYVmo+9dZcOET0ctoXjm8pqxOjBOaAAC+u7LR
 fWaKadqDtuY0lyq5/FT+cY8SB3uhFhVksTVPw4OWaRgIAfyvH6j/tQzIT7pu4ABZzilXWR7mmiW
 twzvTW6wRgiZOuDWnOzOPr4uej+rFT1frKdvo96/yFeWIFgouE6nMO+bS/1SB7Of6V1/AmR7e5+
 3+6UAY+2V65/Uc/IzMC6LDVqaubs1XJSjXyMGUbztLV6AiNHQuvYcwB0uo6ixEIJ/eu/UkuoHqC
 F/ESzV51lcFDwi2LWFA==
X-Proofpoint-ORIG-GUID: 1lZT1fu95ik5BZKegnKfaACDDL258DQ3
X-Proofpoint-GUID: 1lZT1fu95ik5BZKegnKfaACDDL258DQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280103


On Sat, 04 Jul 2026 23:01:41 +0800, Pengpeng Hou wrote:
> The driver has a match table for the of bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
      commit: e89485455ac49925565061733c0d73d568333fc0

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
