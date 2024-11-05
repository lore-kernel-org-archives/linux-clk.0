Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D181D279C
	for <linux-clk@vger.kernel.org>; Tue,  5 Nov 2024 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730802091; cv=none; b=Mjy5uIT1kU9WBXpOKNhWQopni0wY+CJsgfaskxYbzDCDY6xSJe7w30DCeFOnIu9hjL8+LGYbIuEsvEaCjyCwNSOwfLiWkYxnx1j3R8ZQXfdQmp8jxG+VPaSDwq5x3sANDzsBRso1pY9i+2GL/yFIqC9kqEq+4MU0cK+VSI4Lu0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730802091; c=relaxed/simple;
	bh=e8qzjK8wn7V6pR2JgvorL3aV+z7+dV9RogYRqw8CPc4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NXFyIWKoO0rYRYvl/bFZz+MZn3Dt6XxtBq3DN1x1J/NdysI3z8kYXVLmpFaG8gJbbQYq75LY3NmDwwSbq3A0TuAxFlOUgJti7KkliUMX3mahD2ukJcz7dvtgIZo0WkNuFm1ddcqiKbwilz6DMHcD9CvMXEAvwEENzRwbdGRoM7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tNbhNd0p; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tNbhNd0p"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so46814895e9.0
        for <linux-clk@vger.kernel.org>; Tue, 05 Nov 2024 02:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730802088; x=1731406888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoTz69DqvACSD8CBEPwT4eOilZdTZnXMbIwAq3J92NA=;
        b=tNbhNd0pgurmR5ftGpoNqyhvwwmX5rXTV7Hj3+6BYqPpaQf6wk6+JowhIMHnMWdEqX
         z7OlZk3fITUKNKz1LIJQ40EdJ/MvMPKl5h2fuDbom4yWtVx1uPLvSReZFu+G9nxK2Mrp
         2z+AInfiMJaGy8vy6PP94WO/jCUtq7UjMhSOLYdmZblUBs7vwRJpkJnmE51cdjHkETWH
         h7cAGYxzUX+4tdzZFLL6HfEnQ9M5Pr9Rw/UoAK1rSxp9ybfAy1L5fg1KG6/6rN5AbRxE
         QNVuSUFWwa0tvSJ0JyNLHCaMcwJKd7/bEVenUa+M1V6ilNfzkWKMtuafo1Do9MvoY05n
         anUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730802088; x=1731406888;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yoTz69DqvACSD8CBEPwT4eOilZdTZnXMbIwAq3J92NA=;
        b=K3hfwAT2krgzlDFkM4c7feCSz+sZarm87VAcrKEsoS6hlYiKKXAk3tbHfW0FdFx9Cv
         cWJt60W/NiwMTYTseBazCU1yvCyzHZrHk6KeNSo2kx/5oFD6CHo7+5sxd1cHjEr7CD+I
         AGRtH3jOYpUjDy5NLhHCeV5GgbCOkq0fihS0gCLvCtqcSTExVYIvP83Uy5F849KfSoe4
         4SIPbF2x5smD+s9cBRHIcRBHfQfn+Sm6ar5ZvshRJHJErL1cspxqiwnXZ789qgdKHdK9
         EhgVlK75TpE+nWJuHz99rFoTPW/mkYSq7WQN2LlZi9zPq0MDpVuFkHO/RpgT4nppC6ad
         kR+Q==
X-Gm-Message-State: AOJu0YynMbkq0WbLcp0Iw9SfZCXEgp9v4G/s2RV1fL3hvRP+r+YKYeGQ
	7+A3kFzkr6uf/3YKUtybiaHZAiXpAaCreyKg1FJWMnXu5FhQyXvQTqFth98loPk=
X-Google-Smtp-Source: AGHT+IGhTzaLnUJnmHRZSzgGxrM3U4OgmFgwskj92OvzVj2AixI0DYQbDFQWRMdJI2wBSw4KAsMB4g==
X-Received: by 2002:a05:600c:46cf:b0:431:58bc:ad5e with SMTP id 5b1f17b1804b1-4327b80c8bamr148149915e9.28.1730802088210;
        Tue, 05 Nov 2024 02:21:28 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9a9faesm212613885e9.35.2024.11.05.02.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:21:27 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
 sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, shengjiu.wang@nxp.com, 
 Yang Yingliang <yangyingliang@huaweicloud.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 yangyingliang@huawei.com, bobo.shaobowang@huawei.com
In-Reply-To: <20241026112452.1523-1-yangyingliang@huaweicloud.com>
References: <20241026112452.1523-1-yangyingliang@huaweicloud.com>
Subject: Re: [PATCH] clk: imx: imx8-acm: Fix return value check in
 clk_imx_acm_attach_pm_domains()
Message-Id: <173080208692.1891981.1146634464143827722.b4-ty@linaro.org>
Date: Tue, 05 Nov 2024 12:21:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Sat, 26 Oct 2024 19:24:52 +0800, Yang Yingliang wrote:
> If device_link_add() fails, it returns NULL pointer not ERR_PTR(),
> replace IS_ERR() with NULL pointer check, and return -EINVAL.
> 
> 

Applied, thanks!

[1/1] clk: imx: imx8-acm: Fix return value check in clk_imx_acm_attach_pm_domains()
      commit: 81a206d736c19139d3863b79e7174f9e98b45499

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

