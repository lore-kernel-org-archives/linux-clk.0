Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E00522D9F3
	for <linux-clk@vger.kernel.org>; Mon, 23 Jun 2025 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667653; cv=none; b=XdI4qAQ8ukzxua7o1amHYgtgQiBAnNwajNVsuObE+lRpqJ3gskYgwqlTA5lf0nieStkigldMRnjJon0aUES/J8AAWJxwR1lfmnJLbPBoLbezxHKNUkKaLOa3kvWRIR7/lIQb41gomH6a1P4qFEHQpVp5xIXuREJZGLIUDppknuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667653; c=relaxed/simple;
	bh=vLww2eGHeZc4ZEtzZZSOGEU6r7W4F67eKI8Q0JDb0Po=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XUYxL1nkkk+XS7+A9WsYm+tPqGuNTykDcei1Lr9eHEbvtugS+ZKUAuF+2J5mGugJX4cLCKYkWhx0TrRQOyddb3muB8inoun+TW457C9YJMJ0MTy0lPNjwfV6KN3/Hgnm639WX9imn8iCdCNMi5a6CoMUR7/tPTPeXZPbFtltJTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XrIcSGtW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XrIcSGtW"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453608ed113so33962295e9.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Jun 2025 01:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750667649; x=1751272449; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6V4vS/eU1Q8rEblmiZ9Om+oGMdxgfuC51356EGTOok=;
        b=XrIcSGtWVKaDW3FnqFgesWzizpNmq2x6P9OwDNrephFbcnUtTHh2wAX5+WosX33SNG
         6r14OoXUThXYfo4LFPYV8kv/3PrEszyAqXU9EVRiPs93+7i1+RVawzoFZ36vwWk+oe6M
         ZmpiewVRG86PnW4CXoqwlTBcuxe5KKSHwXRKRMZCdJcG9CYUalOy6cy58LwZMTQ57sfO
         FHn34HDQTGLUOxVe/dVOdtKRWjavayotQ3bmvIlpKwyxjudndzfpjVr97K88JDl9ou1P
         cks84R7OaPfBID9MVoMhM9BbSQkCbDnNZ4iapRgJVMMIwWv6M7XrncbCe3GYgokhPkJ+
         xZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750667649; x=1751272449;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6V4vS/eU1Q8rEblmiZ9Om+oGMdxgfuC51356EGTOok=;
        b=CNxtTmHyCe6BQWHiGLt3mxfFB8C3LJfpUyIaWAn9dpgTx2DklYALMze7+apFElhOli
         MOlux7/NZWdydYducuEndww0C9ZIc+dHmvw3iuYO4u9ayda/fMBSgZ+DYCpaJeYtcbVy
         GBs2JydZD/J4DFPeSiDw0ToVmM23vc49sDaxC8VbJ04KTZubiRMLtL+wsaQv5Habv+ul
         aUzvUPPwJoyzBYyeib1g/fEJX2XfI4qTMG8ngoJlVYJedZPzJSGInrPt3JMMJaIS7SJX
         z0o/wRLATlsZUGftEGiqbojegW4s1aWdp3Ny9ncZPmbPuEU+Hmtn/V0HRINFkTJKFn1i
         BzoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT83HXVBjf2kiXeMIQlX2jWxFLbgu+duDc0U187WMJJlRQMfs6iYrBaLAlnliJRS1kFrIYxlQq8oE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmazQT6rRO7HtHPN2lAGQEsZw+5BvZ+CtyV0c2My2A4emfZXTg
	XIS30uCz2HTc33K9b62YwiqH++gH/rJ889vK7Ds3g+aqCFbjYbhFYVFYTx2rB4bkjWs=
X-Gm-Gg: ASbGncunOhPQoHSg0Zvjfp3i9hpBUnIx7sKoG2DWZ+uKj8h24nb3K++xv+KZ+W/O2++
	oXtXbnaS4WgL8IxUVsBiyQHn/UBtJhAlmD/U2MSIK404zMhTEAmcWBW4HNSdsfG5Aoh+1arIsRn
	0EDW49BXEeOOvK+xsa7hUQi8Auc/fHS4IGZ3nNHYvgpp5Ud6IZ615+MoucK0o4HKUl5mIDRLpZP
	kMWJo7w/92SYUo5TQVopdwS2AcZQJGJQRYxwsV0PqQHlINfsHOW+tGgcRKgotpeMr9yZqMTcDHM
	yTX1DQmiOPhDYKbRrY6r8GWYT0wGuVcxn6swLUa+ZkLXd627ZA2j790E81xJ
X-Google-Smtp-Source: AGHT+IHSJfvK6dQbPraZ8PZJdEqb5ZYNuG0wqSXtbY+ekDrm3YLiM3GUQj5KWveW7N4Q0Rxk3iAgdg==
X-Received: by 2002:a05:600c:1f94:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-45365a05192mr105949495e9.30.1750667648653;
        Mon, 23 Jun 2025 01:34:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:dd07:164c:d535:3e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453624554cfsm75443835e9.0.2025.06.23.01.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:34:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: add a clk_hw helpers to get the clock device
 or device_node
In-Reply-To: <175040405169.4372.877329870252746551@lazor> (Stephen Boyd's
	message of "Fri, 20 Jun 2025 00:20:51 -0700")
References: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
	<175040405169.4372.877329870252746551@lazor>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 23 Jun 2025 10:34:07 +0200
Message-ID: <1jo6uekgao.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 20 Jun 2025 at 00:20, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2025-04-17 06:44:21)
>> This patchset adds helpers to get the device or device_node associated with
>> clk_hw. This can be used by clock drivers to access various device related
>> functionality. The 2nd changes adds kunit test coverage for the new helpers
>> 
>
> I've pushed this to clk-hw-device, splitting the test patch into two and
> reworking it. Let me know if you see anything off.

Thanks a lot Stephen !

You could keep the authorship of the 2nd patch I think, it is more a
rewrite than a rework. Either way, it is fine by me. Thanks again.

-- 
Jerome
