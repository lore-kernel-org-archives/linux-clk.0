Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6914669300
	for <linux-clk@vger.kernel.org>; Thu,  8 Feb 2024 07:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707375882; cv=none; b=kXaoM7+thK4q01oG7NfvLdWwloL9RAgAS8k8IAzP4bTJ8gGazH2PY7CuJv4oWDGep0tiQ9lKEnsgq2EuAsbPQKYSP7y6gF42DGpINhRIYsvB3GnbwrWOegy+pjPT/9YHNV1YNbxj2ToLKxDdrs7JyEu9GZ91SelJRm0ENIwot1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707375882; c=relaxed/simple;
	bh=/dUEdEbwNUhZ+aQMRIuPq7jmcRmW4Aamy65pmoNUbZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TswgaL+2qZB4/eQXkkNJ8QlNzsT0A4F1BxK1U2HIvzdo52ds2y8S97dgK0A80EkGyGWze6fWDyHUGR3+fK7y+190SfoReKw7SE290D5yU7fAQK/KSSkJ/jUYfxIkqYQ2798rJl+v54tKSAmADKFQAupUur11ISnLUiNCp+kmtZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SDZqL43k; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SDZqL43k"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60492003050so14445697b3.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Feb 2024 23:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707375880; x=1707980680; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bPKD4ep9YOuiWl27Ev0wM1SentiITExStFxFca8q9z0=;
        b=SDZqL43kVgJ+PxWF9Mda2W2Yd1uvg/vKaCsbeFbxPJwkjB3ytS0z0JQ0E4610GFd7l
         hy3/jqP9o4H3PnhwqHaP374DFecWQcxLG49SJeVpQeyzvzlv8VddGlJ68w4JOXMLWBAl
         8KAr11OknlkPcD3ep6WDPbC2cYGIEBat/w+hhIJgSAmY5M1GF5haZgX++JqhQuSwAB6g
         GbrldnkpdDI2spKwj86FvTEaRzFmCtQ+5p7C1x7LfzPe2sJGEuf1Y1PZWQCxsJbMq72+
         /g0Fvfvg/B+h39ooxo+zjby0b8DepuKWvhalZ9cP1J4DyoPLlpX5R0fwhIZTjXX8UDIz
         9o8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707375880; x=1707980680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPKD4ep9YOuiWl27Ev0wM1SentiITExStFxFca8q9z0=;
        b=kK2ZxjAunpjPtEQl3HKTiz8FCVqr6GsKeBb1PfrPlVOzQVSvYBbDi6NPEiXSeXe5SG
         b7iQvBTI3sHH+fx24vmVwJPNwG6QwLXszorxbXUc/y7dFdxqKIbUKEwcF5hV6+wBZ/MA
         rbTRyCR57OhrsCklEwpXYWGJzWeh0mDLsxDLwAeIwkTdi1GVqtUBxKA4QGsDVBPl+3j9
         4VtB+8ARUZd85/4XFOPSFa7nf6EmGGc4hI+3TkYhS0Fgo0AdUWn+ivL/PFH9ns66r07W
         in0x8ZxIDIpWTRDOxvVERhyuI8E5lU7UWH4B0QI6vHmkxgB+FR8XNNPSdhaKrIxuDZio
         haRg==
X-Forwarded-Encrypted: i=1; AJvYcCXuYcEq0iGZMx9jCqd+KDl/Iwm+aui3eD8MxkXgrWSYutaXYWaH8T85ZAW6Z3x/KLrXhSnltLSDGJtHhloqWuyDbDAR5KOiKs9M
X-Gm-Message-State: AOJu0Yx0EgtvsbUJDIS+wxOz2TCh+kGe7bntyTTC9BguAqud324uE5Yh
	OoUFleCS3+h5LvyaHrk9jREmxzMFWFzjnt1dqcOxzhwwD/CGs8WaddUXeArsu4OF8DcqXqe+HSJ
	2bXtRQ8W5GpFDt+66hoSRxRolrOQcaEMR4wZ2sA==
X-Google-Smtp-Source: AGHT+IEDJiJ1wGIF+76nIiNla0Ud//7eEwT66kMVmwpG2My01XV9c8/1LCp9EBebFzwqkXI0XWHEMhJrSHZvQ5TE0XE=
X-Received: by 2002:a0d:c6c7:0:b0:603:ed0f:af71 with SMTP id
 i190-20020a0dc6c7000000b00603ed0faf71mr7393692ywd.49.1707375880218; Wed, 07
 Feb 2024 23:04:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208062836.19767-1-quic_tdas@quicinc.com> <20240208062836.19767-5-quic_tdas@quicinc.com>
In-Reply-To: <20240208062836.19767-5-quic_tdas@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Feb 2024 09:04:29 +0200
Message-ID: <CAA8EJprwwR9pvnyH8j+5maEOnbry5gjT=hXYQc9ZXVUOegtTtQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: qcom: camcc-sc7280: Add parent dependency to all
 camera GDSCs
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Feb 2024 at 08:29, Taniya Das <quic_tdas@quicinc.com> wrote:
>
> Camera titan top GDSC is a parent supply to all other camera GDSCs. Titan
> top GDSC is required to be enabled before enabling any other camera GDSCs
> and it should be disabled only after all other camera GDSCs are disabled.
> Ensure this behavior by marking titan top GDSC as parent of all other
> camera GDSCs.
>
> Fixes: 1daec8cfebc2 ("clk: qcom: camcc: Add camera clock controller driver for SC7280")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/camcc-sc7280.c | 5 +++++
>  1 file changed, 5 insertions(+)


-- 
With best wishes
Dmitry
