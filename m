Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCDE416CF9
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220579; cv=none; b=SbC5d2muUhB5VxnOid2CujvdfIw3dEWWs0wWAeEGjan39jQYx75jnADbfk/Bv/4KahlFn3AjpMW7+Or6dKQXUPVDzTCNI5Zy98cjrtT3Sn672chYctkyKLEtoFkKzud14AVpiRJvlZX2Yh4n5RnN9IPyLuaGMt8wIMyz2K/b6AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220579; c=relaxed/simple;
	bh=Lx6dG9h1cuSzfbbee7rUL35gEEuG4OyI/9dY1QQnSFY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kVtQOwQ5yDMYDKwEw1KYrVsjJRPNDBbJQnRGNsrtx+Ea4bHt9MqS4g7Gzq3gI/7C/TX5uEZRPLSA9g49aQAvlUNeXm82xDNrs0uskVsYvRpUBJJOn8ZTQx+ZRJ4lA+bhyL6SoNBPGbgDhhPSZznMqk565G0tkBd9KSr38ttnaAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHA83QJZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHA83QJZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954dff6536so17384285e9.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787220572; x=1787825372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AHIZmdtuQlI9QFSmqNoHA5LobKwPmC0fvttFj8Fm4m8=;
        b=FHA83QJZuVLr4SbUqv1V++bNc17ngeSZyift0wGmhWNbxGqOLGYobNgAuvoX0uvBvk
         3gFxxeRf05a4ivdtgcas+q3Lm5cCoWTgu9gRzicM2uQYpDo1ojHwNATI/FLU9qE1Nywt
         7mbFGx8YnEEpvPfig1R5Hkwq4L9TXw8VqHSql6TGJLprrX+tcjLhtUleXzA9XYqaWIl9
         xbb3zER9LLCFgS8cryikJp6tOFQxTrNj7hGlBGMnN+ZrklBnG4JDXzgJ+eR6Vum1g4S2
         EWoi/HYpVg6Q98z1LktXPpBxHmmC7XPoJz/wrupZ8bzRJDJOcAsWkZ2YKPFLJsU0q81d
         5k1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220572; x=1787825372;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHIZmdtuQlI9QFSmqNoHA5LobKwPmC0fvttFj8Fm4m8=;
        b=UATvaKBj0nnbDweqZMXf4W3+g/XOuNCLieM65VkposKNlcuvX7kzMyDAqyT0el7peE
         Nlufok0WMvRptiu496i0NtKrf0YK5gi4kou27A8a4ZxpkkSpobhymaT4vca62+A6rip4
         ok8ZH0oBz921NIoepC0X4t5P8R3rZOdUGNYgeOq73GxPKBAHCHa58SKEP81N3OWVY3E0
         /E7Q0Ev1qhIEg/sJHJAprW1c0VgobySd36quagp7btDJtsh4kQMu+NdFOmmbLmdrz/E1
         zZ2mWdNizWBKVP10x7kLJVjKw0HfT8agaf44JshvlVyi/7/ZhtwG4cEKew6SNafTjtAh
         6y7w==
X-Forwarded-Encrypted: i=1; AHgh+RrP+pTs5me2+BvNTORhmSXvunfNNSs0aYxIww6Lbxpcp1CHU6lPXZYBSmkWo638g266myiBWnhL/hE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlQFhO5TE1AM6JUmADZ2zrYAA7N0JD26osRmfo8wcQDDKHlynj
	0vPjDB9FUt3tNKHXvoFrlP9a2lDmxPhcYHWKMUXAxvMs5yoeyzkJesEM
X-Gm-Gg: AR+sD11WefJK+AU5Njm7eoxvR1mcnZkjGOfRPX6IlGjKbh95XtSDmpPZETTYsjadeNz
	0yRe8R1KR/iTXveU/iElAF57tOilRZI1U3R7MBWErnWFRAAWspuRGffwkYOu45B6yxQQgEBCKlR
	df+3duMEVnDXuuhP3Wd5AHTnwwJEFaZFe/SiS92W18qbC+1xm9UrCzgiiUsB4lNN9vtAEhARqGv
	7AOZNcFgbfc7luhUfIRJ92z1IEfrCYDGQt3Q2FYjEJsVlb8jtAVpwEBHSOfILE0WIm8R29H2iwa
	S9t9zm1+jAv3vY9/u9SW+DoWKXdA5iqVE4VQTl8At2O32nBQPenWR9KXwsk0vaU0B379B+EhHe4
	VlCo03sFJYVe0QWSQta7ffQxnF9Zd+nmYL4akz11Vt757UdRhDd109y/Hes0gBz8U/bYGiKxTIi
	iwOrSV2O0J6iU1C67HQgohwLdFlLPFZffmP0WTMTHswi6pwE3+V/1JrhBOKvv4EHzm6GpAFnexY
	nuhCLcRZZ+thMaq3yrzYBe9ee5lAh7f7cz6kOoFYahXIL94N7nE6afPUUWuCBzkhWbidOqMBx1Z
	+xq5DaOxLfRLcBj11etWwGNEN31UaCgbgdjFG58GhpNrBFiMJXxyP8avpqqraAhi/7NlULGdPb1
	GY6JpGsPABfpa89FBNoS95aq4qqvpLkZRWo3KTPw9jMLDaBGL4E7v4Iq0TkEsvVF1HTKfPQ==
X-Received: by 2002:a05:600c:628d:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-499aa1c9610mr214296435e9.12.1787220571751;
        Thu, 20 Aug 2026 03:09:31 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1947c6sm127708055e9.15.2026.08.20.03.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:31 -0700 (PDT)
Date: Thu, 20 Aug 2026 12:09:24 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Antoniu Miclaus
 <antoniu.miclaus@analog.com>, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Stephen
 Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome
 Brunet <jbrunet+clk@baylibre.com>, linux@analog.com,
 linux-iio@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: frequency: adf4377: Fully initialize
 clk_init_data and clk_parent_data
Message-ID: <20260820120924.00003f65@gmail.com>
In-Reply-To: <ae48ed1dc6b1ad9e10cad0d9df28d9fab213f653.1787216909.git.geert+renesas@glider.be>
References: <ae48ed1dc6b1ad9e10cad0d9df28d9fab213f653.1787216909.git.geert+renesas@glider.be>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Aug 2026 11:19:52 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> adf4377_clk_register() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter is uninitialized, and
> thus may cause a crash.
> 
> Similarly, adf4377_clk_register() fills in only parent_data.fw_name,
> leaving other members of the clk_parent_data structure uninitialized.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: 60e5448ddbec2dc2 ("iio: frequency: adf4377: add clk provider support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
