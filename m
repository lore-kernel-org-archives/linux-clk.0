Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98B1D86E8
	for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2024 07:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730272743; cv=none; b=HhHgMnZ+QS+lgwsjIXH6lqLMKlqenEwAybVf3gkdG64l0pah4mKJcqDWbW62z9CdCrMSNV1HdDsPOe9W/70UPMzS+NAOuY01kUxYILWHtDfTyPTpGZ1+FnzuXG0aIVtOAC1Teq4sQL43AtCMov5QLXTtHS/yB97GCOp5gxEjvAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730272743; c=relaxed/simple;
	bh=GRFuDEnjDgd4OvoRG285WDJtwuTF8sf2Dvf2JM1Qzcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pq2s+X++PAKNlfjqUtsLZn2NHfqa5YmOhw/uWiOzSLpKHtb4yiFIVdUv3G0gmXTBqUr6mN1GCiNPmnJPWwOR1ijCvDrSbJgsLuqFVRU7ovV11HT8yNvFdnPwNMUbBc0YggWGgiGPqW/7XPvlfcoGa3HBU7lkR8bMEtlJ2vTEgj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uXHkZFXq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uXHkZFXq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c714cd9c8so66352155ad.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2024 00:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730272741; x=1730877541; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2HfyfhF6z0IsAsG7O1iQKmomQevqTeSun6SJPILAuAM=;
        b=uXHkZFXqX77GhcG9bKQ/636UdZw45BxhQKW7dNrCZGkH1e7lD8+BxJM/Yc97+nL+H/
         zSy7Rwz+PdBsfnjvgGwcAJgu+iRkgGLLa6P74LlhwjzglS2zrttpJy6dW+IlkTAz0BQw
         tkfYHR+qmhPr7Qhdl1cYFES7WEIp/yLPaubLij4PyRhMF0EGZLi5DBe+TBaSZOP6xsdM
         XWhYvZuI0l27nLC4oNx3azm8SA78oOOZTXrrJaK+k4MD0qunSRTM5KiB5eWDU+WNwlAo
         0V/GoxnRt2Pr/CNYT7DgFwexU+dKQa6ht5hGjoayrkruuBW46Cbt2Ik0NgX6dWJF8KXG
         Vukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730272741; x=1730877541;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HfyfhF6z0IsAsG7O1iQKmomQevqTeSun6SJPILAuAM=;
        b=YMYEbZ6QGOybToDjyBhVNwx7H6iBKRjf/QG+XR1/ClNgNhvddhsD7uEiSlCtEju1fd
         aq8w6J7QU9n9aR6b+3JRpAz/P0corTp7yQkZxi7DZuI1pYDXfAsr4qfLZqBtQkxJ0WWf
         GDiDjSutYPeTnqap5tpzY0YsUErZIXXnR9TQHmceE2cBYmxy35xZLi3C2a8UHrgB6IAW
         oeDabxR9FKJ4oLpihD08PURX1mgje4lqhwuuIBl7jh35WbSTcSJUDYln/UrtzyrFcqDI
         INOmPJS3vcbmcHv55hjcSRVrAX1NcEgOz0vqboRjvjy4SLxQYzU55+lOL/RfM42qoeiK
         4cWA==
X-Forwarded-Encrypted: i=1; AJvYcCWazhbhqOykg6aLOnQAxEpTIqFq3POu2d7nBpjuD8zBreJ/xxLa98F47wqaWJCd02+LQboGbwmXztE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuDmuzwRP3s9It812Bb2iPzzO6JTKYQRKSJDqeqidGwAZmyXiI
	5o1yu+6mIuAw2+ZYqx+2T3cOITlK4clWnS1O3xcQQoGC1g8wLI/FcRtFC6jv0w==
X-Google-Smtp-Source: AGHT+IHTdvrxjuDcs8dqC3K9rXQG1LndTCbbKrjV+g4Yj/M49myE6Ugo2CkOqvAophLbqnU9pTQ4Xw==
X-Received: by 2002:a17:903:2445:b0:20b:775f:506d with SMTP id d9443c01a7336-210c6c123f3mr211614765ad.34.1730272740962;
        Wed, 30 Oct 2024 00:19:00 -0700 (PDT)
Received: from thinkpad ([36.255.17.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf441bdsm75242015ad.52.2024.10.30.00.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:19:00 -0700 (PDT)
Date: Wed, 30 Oct 2024 12:48:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, vkoul@kernel.org, kishon@kernel.org,
	robh@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, abel.vesa@linaro.org, quic_msarkar@quicinc.com,
	quic_devipriy@quicinc.com, dmitry.baryshkov@linaro.org,
	kw@linux.com, lpieralisi@kernel.org, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	johan+linaro@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v7 6/7] PCI: qcom: Disable ASPM L0s and remove BDF2SID
 mapping config for X1E80100 SoC
Message-ID: <20241030071851.sdm3fu6ecaddoiit@thinkpad>
References: <20241017030412.265000-1-quic_qianyu@quicinc.com>
 <20241017030412.265000-7-quic_qianyu@quicinc.com>
 <ZxJrUQDGMDw3wI3Q@hovoldconsulting.com>
 <91395c5e-22a0-4117-a4b5-4985284289ab@quicinc.com>
 <250bce05-a095-4eb3-a445-70bbf4366526@quicinc.com>
 <ZyHc-TkRtKxLU5-p@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyHc-TkRtKxLU5-p@hovoldconsulting.com>

On Wed, Oct 30, 2024 at 08:15:05AM +0100, Johan Hovold wrote:
> On Wed, Oct 30, 2024 at 01:54:59PM +0800, Qiang Yu wrote:
> > On 10/24/2024 2:42 PM, Qiang Yu wrote:
> > > On 10/18/2024 10:06 PM, Johan Hovold wrote:
> 
> > >> Also say something about how L0s is broken so that it is more clear what
> > >> the effect of this patch is. On sc8280xp enabling L0s lead to
> > >> correctable errors for example.
> 
> > > Need more time to confirm the exact reason about disabling L0s.
> > > Will update if get any progress
> 
> > I confirmed with HW team and SW team. L0s is not supported on X1E80100, 
> > it is not fully verified. So we don't want to enable it.
> 
> Thanks for checking. A word about what can happen if not disabling it
> may still be in place (e.g. the link state transition stats in debugfs
> on x1e80100 looked pretty erratic with L0s enabled IIRC).
> 
> Also, are there any Qualcomm platforms that actually support L0s?
> Perhaps we should just disable it everywhere?
> 

Most of the mobile chipsets from Qcom support L0s. It is not supported only on
the compute ones. So we cannot disable it everywhere.

Again, it is not the hw issue but the PHY init sequence not tuned support L0s.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
