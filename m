Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D51B1D31A5
	for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 18:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781856; cv=none; b=fe5Qi9qagrk1hnqzqCCAYneq6ZDXHBBFIYaWI8lVkT95yqk22ElvuH2qX+pao6cWGqtNZ9sEBY3xP9ecs6M24fxQA2O+ssMgvILO03pJR+1EUSQ3nd50HR9G3UcyKLd90mABdWVs2m44DkP0P86oflWU1EdGRSAOaJKu6B+wODo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781856; c=relaxed/simple;
	bh=dMLDKe44fCDwnHMVTWPeFlG+Xo4vnWXVI5dcdgD1bYs=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAoqzf5LcSg9grnOIWCjcVB01+L+P+NFuASFwhRBcye72mOezwJPqZ9IXysOEKz9C5IGCw/iKcXwp8teB8aGBP2s9juM/ORZX1l6KkPi8h/22atM0ylME921iIVZyUBaATRddeYKB8DP5h32hHQ7WSzrwOQ0Oy+/o7gdEPdOFec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QIZbH10N; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QIZbH10N"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e116d2f5f7fso5073729276.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 11:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724781853; x=1725386653; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMLDKe44fCDwnHMVTWPeFlG+Xo4vnWXVI5dcdgD1bYs=;
        b=QIZbH10NZHJZralFoSyn8LA+6zuUnsh7bTrPreNjKeczWRVIc7fZgT8tJu/Ld4V1nt
         LRdFnJ6JVHwX3RXh6g7KRn7d9HQMI0+ga1ao9LJI0dHnW4BL054RvD/rTH+6hvg0oXCy
         vprFaW5Gx0BkvdqmvZkAEe3LR2vVqUaJt3zww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781853; x=1725386653;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMLDKe44fCDwnHMVTWPeFlG+Xo4vnWXVI5dcdgD1bYs=;
        b=fPa4HDZaoDehp9H5vFPCuRhSLUkIqQotO4N9j08EdihIkQV/psKLltYV1rkgUn5X4S
         LvDSbCZ+c/PpWGuB7RLCwiblxsrRQ0pXJgCLTivaIdF/KNbqGlS1DGEtpHG6ypiSbX1D
         6k2v/IynKs6173GIteWl2WrdrDZWA60WxxDyettjcbw955qIqBSUjb2TWmC4z7qwQfXV
         xfp+pws5aG0aXpW9hT8nC2pEv00DIwRsUqrRyVSbb86O+NnHBXr+E3KjE4OoE97xhOGH
         /O9mXa2ZCekV5455cKt+yYKz0zBcyh31ESBA0xR9muG+MTig3spnv80MteFpAkyUOrri
         A7sA==
X-Forwarded-Encrypted: i=1; AJvYcCVeevFoWSUWAkuH2TQ29Hk/6TD8jgCmpt5k0htwx6MQuqk8UB+267oYP95yJIsFFvQ+XcG6KxzXOzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSJlEwcTLSQS/4PDXCCItoVdPY9yD7rsB34tyJPga+QF1eo1EF
	wUD3Xl944P6Tw3u047feQ2cXvJHtrDAiaJuDszwF3NjiIGWDQo2u0Y4EQChcrYwlchkWkaq+lg5
	vcnqLoH5BP9jXXda72YCwgKG3aYb1hY1VAXDy
X-Google-Smtp-Source: AGHT+IE0Bn9i/bUKuhoTzrKG4rVSXstRxEFMj4JTAl4ym01IvcLZrTD5rOM1gwCNkQJJ0jrFSUsDnYcxg59QUJYwibU=
X-Received: by 2002:a25:dcc5:0:b0:e11:7588:3329 with SMTP id
 3f1490d57ef6-e1a42273847mr72517276.7.1724781853199; Tue, 27 Aug 2024 11:04:13
 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Aug 2024 18:04:12 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240819233628.2074654-3-swboyd@chromium.org>
References: <20240819233628.2074654-1-swboyd@chromium.org> <20240819233628.2074654-3-swboyd@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 27 Aug 2024 18:04:12 +0000
Message-ID: <CAE-0n52xg2ts9dm4cG1CmevrD0Gn8d9x+VvK8av8Fn8esoz14g@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sm8550: Don't park the USB RCG at
 registration time
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, linux-clk@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Stephen Boyd (2024-08-19 16:36:27)
> Amit Pundir reports that audio and USB-C host mode stops working if the
> gcc_usb30_prim_master_clk_src clk is registered and
> clk_rcg2_shared_init() parks it on XO. Skip parking this clk at
> registration time to fix those issues.
>
> Partially revert commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
> registration") by skipping the parking bit for this clk, but keep the
> part where we cache the config register. That's still necessary to
> figure out the true parent of the clk at registration time.
>
> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
> Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Applied to clk-fixes
